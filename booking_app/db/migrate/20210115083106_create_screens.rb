class CreateScreens < ActiveRecord::Migration[5.2]
  def change
    create_table :screens do |t|
      t.string :title
      t.integer :seat_count

      t.timestamps
    end
  end
end
