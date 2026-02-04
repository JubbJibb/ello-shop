class UpdateSettingsPricePerBagDefaults < ActiveRecord::Migration[8.1]
  def up
    execute "UPDATE settings SET price_per_bag = 60 WHERE price_per_bag IS NULL"
    change_column_default :settings, :price_per_bag, from: nil, to: 60
    change_column_null :settings, :price_per_bag, false
  end

  def down
    change_column_null :settings, :price_per_bag, true
    change_column_default :settings, :price_per_bag, from: 60, to: nil
  end
end
