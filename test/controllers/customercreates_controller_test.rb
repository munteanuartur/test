require "test_helper"

class CustomercreatesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customercreates_show_url
    assert_response :success
  end
end
