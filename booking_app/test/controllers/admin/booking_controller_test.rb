require 'test_helper'

class Admin::BookingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_booking_index_url
    assert_response :success
  end

end
