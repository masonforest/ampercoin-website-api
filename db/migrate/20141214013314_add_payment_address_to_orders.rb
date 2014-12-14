class AddPaymentAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_address, :string
  end
end
