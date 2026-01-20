class StorefrontController < ApplicationController
  def index
    @order = Order.new
    @price_per_bag = Setting.first&.price_per_bag || Setting::DEFAULT_PRICE_PER_BAG
  end
end
