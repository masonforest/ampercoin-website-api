class Order < ActiveRecord::Base
  after_create :generate_payment_address

  def generate_payment_address
    response = Blockchain::receive(ENV['PAY_TO_ADDRESS'], callback_url)
    update(payment_address: response.input_address)
  end

  def callback_url
    "#{ENV['HOST']}/orders/#{id}/payments"
  end
end
