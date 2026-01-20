require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      post orders_url, params: { order: { chicken_qty: @order.chicken_qty, customer_address: @order.customer_address, customer_name: @order.customer_name, delivery_channel: @order.delivery_channel, delivery_date: @order.delivery_date, delivery_fee: @order.delivery_fee, order_date: @order.order_date, pork_qty: @order.pork_qty, status: @order.status } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { chicken_qty: @order.chicken_qty, customer_address: @order.customer_address, customer_name: @order.customer_name, delivery_channel: @order.delivery_channel, delivery_date: @order.delivery_date, delivery_fee: @order.delivery_fee, order_date: @order.order_date, pork_qty: @order.pork_qty, status: @order.status } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference("Order.count", -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
