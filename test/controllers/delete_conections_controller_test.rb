require "test_helper"

class DeleteConectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get delete_conections_show_url
    assert_response :success
  end
end
