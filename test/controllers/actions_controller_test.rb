require "test_helper"

class ActionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get actions_new_url
    assert_response :success
  end

  test "should get show" do
    get actions_show_url
    assert_response :success
  end
end
