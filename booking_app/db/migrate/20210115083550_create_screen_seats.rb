class CreateScreenSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :screen_seats do |t|
      t.string :title
      t.references :screen, foreign_key: true
      t.string :seat_row
      t.string :seat_col
      t.float :price

      t.timestamps
    end
  end
end
