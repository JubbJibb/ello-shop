json.extract! order, :id, :order_date, :customer_name, :customer_address, :pork_qty, :chicken_qty, :delivery_channel, :delivery_fee, :delivery_date, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
