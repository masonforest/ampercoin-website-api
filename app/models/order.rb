class Order < ActiveRecord::Base
  belongs_to :preordered_account
  after_create :generate_payment_address

  def paid?
    payment_transaction.present?
  end

  def pay(payment_transaction: nil)
    update(payment_transaction: payment_transaction)
    create_ampercoin_account
    notify_clients_of_payment
  end

  def generate_payment_address
    if Rails.env.production?
      #response = Blockchain::receive(ENV['PAY_TO_ADDRESS'], callback_url)
      response = $coinbase.generate_receive_address(
        address: {
          callback_url: callback_url
        }
      )
      payment_address= response.address
    else
      payment_address = '1PVqYRc5crxQwqWhZaRR5VfetMjpup59Bb'
    end

    update(payment_address: payment_address)
  end

  def callback_url
    "#{ENV['HOST']}/orders/#{id}/payments"
  end

  private

  def notify_clients_of_payment
    Pusher.trigger(:payments, :paid, { order_id: id })
  end

  def create_ampercoin_account
    url = "#{ENV['AMPERCOIN_NODE']}/accounts"
    HTTParty.post(url,
      body: {
        account: {
          address: preordered_account.address,
          public_key: preordered_account.public_key
        }
      }
    )
  end
end
