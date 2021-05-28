require "test_helper"

class ShowconnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get showconnections_show_url
    assert_response :success
  end
end
