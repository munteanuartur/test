require "test_helper"

class ReconectControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get reconect_show_url
    assert_response :success
  end
end
