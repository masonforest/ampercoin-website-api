class PaymentsController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    order.pay(payment_transaction: params[:transaction][:id] )

    head status: :ok
  end
end
