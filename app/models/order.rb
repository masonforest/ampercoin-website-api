class Order < ActiveRecord::Base
  after_create :generate_payment_address

  def paid?
    payment_transaction.present?
  end

  def generate_payment_address
    #response = Blockchain::receive(ENV['PAY_TO_ADDRESS'], callback_url)
    response = $coinbase.generate_receive_address(
      address: {
        callback_url: callback_url
      }
    )

    update(payment_address: response.address)
  end

  def callback_url
    "#{ENV['HOST']}/orders/#{id}/payments"
  end
end
