require "test_helper"

class DelconnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get delconnections_new_url
    assert_response :success
  end

  test "should get show" do
    get delconnections_show_url
    assert_response :success
  end
end
