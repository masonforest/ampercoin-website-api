class PaymentsController < ApplicationController
  def create
    transaction_params = JSON.parse(params.first[0])
    order = Order.find(params[:order_id])

    if params[:key] == ENV['PAYMENT_SECRET_KEY'] && transaction_params["amount"] >= 0.02
        order.pay(payment_transaction: transaction_params["transaction"]["hash"] )
    end

    head status: :ok
  end
end
