require 'test_helper'

class FrontendControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get frontend_new_url
    assert_response :success
  end

end
