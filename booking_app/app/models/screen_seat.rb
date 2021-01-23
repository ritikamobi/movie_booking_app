class ScreenSeat < ApplicationRecord
  belongs_to :screen
  belongs_to :screen_slot

  def self.get_seat_layout(screen_id, slot_id)
  	seats = self.joins(screen: :screen_slot).where("screen_seats.screen_id =? and screen_slots.id =?", screen_id, slot_id ).select('screen_seats.id, screen_seats.seat_row, screen_seats.price, screen_seats.title, screen_seats.seat_col')
		seat_arr = []   
		seats.each do |seat|
			booking = Booking.select("id").where("screen_seat_id =? and screen_slot_id =?", seat.id, slot_id)
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
    return  seat_arr
  end
end

