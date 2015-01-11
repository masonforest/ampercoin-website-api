class PaymentsController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    if params[:key] == ENV['PAYMENT_SECRET_KEY'] && params[:amount] >= 0.02
        order.pay(payment_transaction: params[:transaction][:id] )
    end

    head status: :ok
  end
end
