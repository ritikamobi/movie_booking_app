class CreateScreenMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :screen_movies do |t|
      t.references :screen, foreign_key: true
      t.references :movie, foreign_key: true
      t.date :on_date

      t.timestamps
    end
  end
end
