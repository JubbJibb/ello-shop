class Setting < ApplicationRecord
  DEFAULT_PRICE_PER_BAG = 60

  def self.current
    first_or_create!(price_per_bag: DEFAULT_PRICE_PER_BAG)
  end
end
