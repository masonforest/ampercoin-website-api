class AddPaymentTransactionToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_transaction, :string
  end
end
