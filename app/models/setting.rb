class Setting < ApplicationRecord
  DEFAULT_PRICE_PER_BAG = 60

  validates :price_per_bag,
            presence: true,
            numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def self.current
    setting = first_or_initialize
    setting.price_per_bag ||= DEFAULT_PRICE_PER_BAG
    setting.save! if setting.changed?
    setting
  end
end
