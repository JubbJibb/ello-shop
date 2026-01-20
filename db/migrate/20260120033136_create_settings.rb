class CreateSettings < ActiveRecord::Migration[8.1]
  def change
    create_table :settings do |t|
      t.integer :price_per_bag

      t.timestamps
    end
  end
end
