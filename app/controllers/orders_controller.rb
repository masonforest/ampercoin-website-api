class OrdersController < ApplicationController
  def create
    order = Order.create(order_params)
    redirect_to order
  end

  def show
    order = Order.find(params[:id])
    render json: order
  end

  def order_params
    params.require(:order).permit(:amount, :address)
  end
end
