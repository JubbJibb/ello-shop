class Order < ApplicationRecord
  STATUSES = %w[Packing Done Cancelled].freeze
  DELIVERY_CHANNELS = ["Pickup", "Local Delivery", "Courier"].freeze
  PRODUCTS = [
    {
      key: :pork_qty,
      name: "Pork bag",
      description: "Savory pork cookies packed fresh."
    },
    {
      key: :chicken_qty,
      name: "Chicken bag",
      description: "Golden chicken cookies with a crisp bite."
    }
  ].freeze

  before_validation :set_defaults, on: :create

  validates :customer_name, presence: true
  validates :pork_qty, :chicken_qty, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :status, inclusion: { in: STATUSES }, allow_blank: true
  validates :delivery_channel, inclusion: { in: DELIVERY_CHANNELS }, allow_blank: true
  validate :at_least_one_bag

  def total_bags
    PRODUCTS.sum { |product| public_send(product[:key]).to_i }
  end

  def price_per_bag
    Setting.first&.price_per_bag || Setting::DEFAULT_PRICE_PER_BAG
  end

  def order_cost
    total_bags * price_per_bag
  end

  def delivery_cost
    delivery_fee.to_i
  end

  def total_cost
    order_cost + delivery_cost
  end

  def product_quantities
    PRODUCTS.map do |product|
      quantity = public_send(product[:key]).to_i
      next if quantity.zero?

      product.merge(quantity: quantity)
    end.compact
  end

  private

  def set_defaults
    self.order_date ||= Date.current
    self.status ||= "Packing"
  end

  def at_least_one_bag
    return if total_bags.positive?

    errors.add(:base, "Select at least one bag to place an order.")
  end
end
  