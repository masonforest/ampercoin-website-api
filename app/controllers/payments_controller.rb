class PaymentsController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    order.update(payment_transaction: params[:transaction][:id] )
    Pusher.trigger(:payments, :paid, {order_id: order.id})

    head status: :ok
  end
end
