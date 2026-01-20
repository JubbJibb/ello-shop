require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @setting = settings(:one)
  end

  test "should get edit" do
    get edit_settings_url
    assert_response :success
  end

  test "should update setting" do
    patch settings_url, params: { setting: { price_per_bag: @setting.price_per_bag + 5 } }
    assert_redirected_to orders_url
  end
end
