require "test_helper"

class TranzactionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tranzaction_show_url
    assert_response :success
  end
end
