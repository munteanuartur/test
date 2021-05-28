require "test_helper"

class ShowCustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get show_customer_show_url
    assert_response :success
  end
end
