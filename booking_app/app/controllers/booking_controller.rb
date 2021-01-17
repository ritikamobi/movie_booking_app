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
  	screens = ScreenMovie.includes(:screen).where(movie_id: params[:movie_id], on_date: params[:on_date])
  	scr_arr = []
  	screens.each do |scn|
  		scr_hash = Hash.new()
  		scr_hash['screen_movie_id'] = scn.id
  		scr_hash['id'] = scn.screen.id
  		scr_hash['title'] = scn.screen.title
  		scr_arr << scr_hash 
  	end
  	@screens = scr_arr
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
  	seats = ScreenSeat.joins(screen: :screen_slot).where("screen_seats.screen_id =? and screen_slots.id =?", params[:screen_id], params[:slot_id] ).select('screen_seats.id, screen_seats.seat_row, screen_seats.price, screen_seats.title, screen_seats.seat_col')
		seat_arr = []   
		seats.each do |seat|
			booking = Booking.select("id").where("screen_seat_id =? and screen_slot_id =?", seat.id, params[:slot_id])
			seat_avl = booking.present? ? false : true
      seat_hash = Hash.new()
      seat_hash['id'] = seat.id
      seat_hash['seat_row'] = seat.seat_row
      seat_hash['seat_col'] = seat.seat_col
      seat_hash['seat_cost'] = seat.price
      seat_hash['title'] = seat.title
      seat_hash['seat_avl'] = seat_avl
      seat_arr << seat_hash
    end
    @layout = seat_arr
    @max_row = seats.max_by{|x| x['seat_row']}.seat_row.to_i
    @max_col = seats.max_by{|x| x['seat_col']}.seat_col.to_i

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
  	booking = Booking.create!(user_id: current_user.id, booking_date: DateTime.now, screen_seat_id: seat_info.id, price: seat_info.price, status: 1, screen_slot_id: params[:slot_id], screen_movie_id: params[:screen_movie_id])
  	if booking.save
  		booking_hash = Hash.new 
  		booking_hash[:user_email] 		 = booking.user.email
  		booking_hash[:movie_date] 		 = booking.screen_movie.on_date
  		booking_hash[:booked_seat] 	 	 = booking.screen_seat.title
  		booking_hash[:booking_price]   = booking.price
  		booking_hash[:booking_date] 	 = format_date_time(booking.booking_date)
  		booking_hash[:booking_slot] 	 = booking.screen_slot.slot_time
  		booking_hash[:booking_audi] 	 = booking.screen_slot.screen.title
  		booking_hash[:booking_movie] 	 = booking.screen_movie.movie.title
  		booking_hash[:booking_status]  = format_status(booking.status)
  		SiteMailer.booking_confirmation(booking_hash).deliver_now
  	end
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
