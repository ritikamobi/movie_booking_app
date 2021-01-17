class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.datetime :booking_date
      t.references :screen_seat, foreign_key: true
      t.references :screen_slot, foreign_key: true
      t.references :screen_movie, foreign_key: true
      t.float :price
      t.boolean :status

      t.timestamps
    end
  end
end
