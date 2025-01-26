require "test_helper"

class ShapesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shapes_show_url
    assert_response :success
  end
end
