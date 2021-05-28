require "test_helper"

class CreateconnectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get createconnections_show_url
    assert_response :success
  end
end
