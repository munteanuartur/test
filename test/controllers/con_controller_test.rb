require "test_helper"

class ConControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get con_destroy_url
    assert_response :success
  end
end
