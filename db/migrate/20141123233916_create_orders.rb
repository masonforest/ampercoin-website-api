class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders, id: :uuid do |t|
      t.string :address
      t.decimal :amount, precision: 11, scale: 3
      t.timestamps
    end
  end
end
