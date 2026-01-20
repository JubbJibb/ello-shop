class Order < ApplicationRecord
    STATUSES = %w[Packing Done Cancelled].freeze
  
    validates :customer_name, presence: true
    validates :pork_qty, :chicken_qty, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :status, inclusion: { in: STATUSES }, allow_blank: true
  
    def total_bags
      (pork_qty || 0) + (chicken_qty || 0)
    end
  
    def price_per_bag
      Setting.current.price_per_bag
    end
  
    def order_cost
      total_bags * price_per_bag
    end
  
    def delivery_cost
      delivery_fee || 0
    end
  
    def total_cost
      order_cost + delivery_cost
    end
  end
  