class Admin::BookingController < ApplicationController
	layout "booking"

  def index
  	@items = Booking.order(id: :desc).paginate(:page => params[:page], :per_page => 5)
  end
end
