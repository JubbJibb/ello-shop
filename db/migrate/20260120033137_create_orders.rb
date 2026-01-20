class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :customer_name
      t.text :customer_address
      t.integer :pork_qty
      t.integer :chicken_qty
      t.string :delivery_channel
      t.integer :delivery_fee
      t.date :delivery_date
      t.string :status

      t.timestamps
    end
  end
end
