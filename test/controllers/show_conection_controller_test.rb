require "test_helper"

class ShowConectionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get show_conection_show_url
    assert_response :success
  end
end
