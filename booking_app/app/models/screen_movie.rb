class ScreenMovie < ApplicationRecord
  belongs_to :screen
  belongs_to :movie


  def self.get_avl_scrn(movie_id, on_date)
	screens = self.includes(:screen).where(movie_id: movie_id, on_date: on_date)
	scr_arr = []
	screens.each do |scn|
		scr_hash = Hash.new()
		scr_hash['screen_movie_id'] = scn.id
		scr_hash['id'] = scn.screen.id
		scr_hash['title'] = scn.screen.title
		scr_arr << scr_hash 
	end
		screens = scr_arr
		return screens
  end

end
