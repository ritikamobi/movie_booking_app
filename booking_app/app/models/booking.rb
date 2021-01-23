class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screen_seat
  belongs_to :screen_slot
  belongs_to :screen_movie

  def self.create_booking(user_id, booking_date,seat_id, seat_price, status, slot_id, movie_id )
  	booking = self.create!(user_id: user_id, booking_date: booking_date, screen_seat_id: seat_id, price: seat_price, status: status, screen_slot_id: slot_id, screen_movie_id: movie_id)
  	if booking.save
  		booking_hash = Hash.new 
  		booking_hash[:user_email] 		 = booking.user.email
  		booking_hash[:movie_date] 		 = booking.screen_movie.on_date
  		booking_hash[:booked_seat] 	 	 = booking.screen_seat.title
  		booking_hash[:booking_price]   = booking.price
  		booking_hash[:booking_date] 	 = booking.booking_date.strftime("%Y-%m-%d")
  		booking_hash[:booking_slot] 	 = booking.screen_slot.slot_time
  		booking_hash[:booking_audi] 	 = booking.screen_slot.screen.title
  		booking_hash[:booking_movie] 	 = booking.screen_movie.movie.title
  		booking_hash[:booking_status]  = booking.status
  		SiteMailer.booking_confirmation(booking_hash).deliver_now
  	end
  end
end
