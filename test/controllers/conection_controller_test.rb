require "test_helper"

class ConectionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get conection_new_url
    assert_response :success
  end

  test "should get show" do
    get conection_show_url
    assert_response :success
  end
end
