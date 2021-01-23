class BookingController < ApplicationController
  include BookingHelper
  before_action :require_login
  layout "booking"

  #Render index file with movies select tag 
  def index
  	@movies = Movie.all.collect{|x| [x.title, x.id]}
  end
  #Get the screens available for the selected movie
  def screen_avl
  	@screens = ScreenMovie.get_avl_scrn(params[:movie_id], params[:on_date])
    
    respond_to do |format|
      format.js
    end
  end

  #Get the Time slots for the selected screen
  def time_slot
    @slots = ScreenSlot.where(screen_id: params[:screen_id]).collect{|x| [ x.slot_time, x.id]}
    respond_to do |format|
      format.js
    end
  end

  #Get the seat layout for the selected screen and selected slot and check if booking available or not
  def seat_layout
  	@layout = ScreenSeat.get_seat_layout(params[:screen_id],params[:slot_id])
    @max_row = @layout.max_by{|x| x['seat_row']}['seat_row'].to_i
    @max_col = @layout.max_by{|x| x['seat_col']}['seat_col'].to_i
    respond_to do |format|
      format.js
    end
  end

  #Get the tickets preview on the modal
  def ticket_preview
  	seat = ScreenSeat.find(params[:seat_id])
	  render json: seat
  end

  #Post method for booking confirmation
  def confirm_booking
  	seat_info = ScreenSeat.find_by_id(params[:seat_id])
  	booking = Booking.create_booking(current_user.id, DateTime.now, seat_info.id, seat_info.price, 1, params[:slot_id], params[:screen_movie_id] )
  	render json: booking
  end
  #Need to be logged in to use inner pages
  private
  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
