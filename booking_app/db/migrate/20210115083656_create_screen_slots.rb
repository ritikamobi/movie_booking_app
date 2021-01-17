class CreateScreenSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :screen_slots do |t|
      t.string :title
      t.string :slot_time
      t.references :screen, foreign_key: true

      t.timestamps
    end
  end
end
