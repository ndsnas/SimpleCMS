require 'test_helper'

class ExampleControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get view1" do
    get example_controller_view1_url
    assert_response :success
  end

end
