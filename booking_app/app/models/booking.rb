class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screen_seat
  belongs_to :screen_slot
  belongs_to :screen_movie
end
