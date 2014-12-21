class Order < ActiveRecord::Base
  belongs_to :account
  after_create :generate_payment_address

  def paid?
    payment_transaction.present?
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
end
