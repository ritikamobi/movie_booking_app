# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@gmail.com', password: '12345678')

Screen.create!(title: "Screen1", seat_count: 12)
Screen.create!(title: "Screen2", seat_count: 24)

ScreenSlot.create!(title: "T1", slot_time: "12-15", screen_id: 1)
ScreenSlot.create!(title: "T2", slot_time: "15-18", screen_id: 1)
ScreenSlot.create!(title: "T3", slot_time: "18-21", screen_id: 1)
ScreenSlot.create!(title: "T4", slot_time: "21-24", screen_id: 1)
ScreenSlot.create!(title: "T1", slot_time: "12-15", screen_id: 2)
ScreenSlot.create!(title: "T2", slot_time: "15-18", screen_id: 2)
ScreenSlot.create!(title: "T3", slot_time: "18-21", screen_id: 2)
ScreenSlot.create!(title: "T4", slot_time: "21-24", screen_id: 2)

Movie.create!(title: "Movie1")
Movie.create!(title: "Movie2")


ScreenMovie.create!(screen_id: 1, movie_id: 1, on_date: Date.today.strftime('%Y-%m-%d'))
ScreenMovie.create!(screen_id: 2, movie_id: 1, on_date: Date.today.strftime('%Y-%m-%d'))
ScreenMovie.create!(screen_id: 1, movie_id: 2, on_date: Date.today.strftime('%Y-%m-%d'))
ScreenMovie.create!(screen_id: 2 ,movie_id: 2, on_date: Date.today.strftime('%Y-%m-%d'))


ScreenSeat.create!(screen_id: 1 , title: "A1", seat_row: "1", seat_col: "1", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "A2", seat_row: "1", seat_col: "2", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "A3", seat_row: "1", seat_col: "3", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "A4", seat_row: "1" ,seat_col: "4" ,price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "A5", seat_row: "1" ,seat_col: "5" ,price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "A6", seat_row: "1" ,seat_col: "6" ,price: "150"  )

ScreenSeat.create!(screen_id: 1 , title: "B1", seat_row: "2", seat_col: "1", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "B2", seat_row: "2", seat_col: "2", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "B3", seat_row: "2", seat_col: "3", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "B4", seat_row: "2", seat_col: "4", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "B5", seat_row: "2", seat_col: "5", price: "150"  )
ScreenSeat.create!(screen_id: 1 , title: "B6", seat_row: "2", seat_col: "6", price: "150"  )

ScreenSeat.create!(screen_id: 1 , title: "C1", seat_row: "4", seat_col: "1", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "C2", seat_row: "4", seat_col: "2", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "C3", seat_row: "4", seat_col: "3", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "C4", seat_row: "4", seat_col: "4", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "C5", seat_row: "4", seat_col: "5", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "C6", seat_row: "4", seat_col: "6", price: "300"  )

ScreenSeat.create!(screen_id: 1 , title: "D1", seat_row: "5", seat_col: "1", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "D2", seat_row: "5", seat_col: "2", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "D3", seat_row: "5", seat_col: "3", price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "D4", seat_row: "5" ,seat_col: "4" ,price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "D5", seat_row: "5" ,seat_col: "5" ,price: "300"  )
ScreenSeat.create!(screen_id: 1 , title: "D6", seat_row: "5" ,seat_col: "6" ,price: "300"  )


ScreenSeat.create!(screen_id: 2 , title: "A1", seat_row: "1", seat_col: "1", price: "150"  )
ScreenSeat.create!(screen_id: 2 , title: "A2", seat_row: "1", seat_col: "2", price: "150"  )
ScreenSeat.create!(screen_id: 2 , title: "A3", seat_row: "1", seat_col: "3", price: "150"  )
ScreenSeat.create!(screen_id: 2 , title: "A4", seat_row: "1" ,seat_col: "4" ,price: "150"  )

ScreenSeat.create!(screen_id: 2 , title: "B1", seat_row: "2", seat_col: "1", price: "150"  )
ScreenSeat.create!(screen_id: 2 , title: "B2", seat_row: "2", seat_col: "2", price: "150"  )
ScreenSeat.create!(screen_id: 2 , title: "B3", seat_row: "2", seat_col: "3", price: "150"  )
ScreenSeat.create!(screen_id: 2 , title: "B4", seat_row: "2", seat_col: "4", price: "150"  )

ScreenSeat.create!(screen_id: 2 , title: "C1", seat_row: "3", seat_col: "1", price: "300"  )
ScreenSeat.create!(screen_id: 2 , title: "C2", seat_row: "3", seat_col: "2", price: "300"  )
ScreenSeat.create!(screen_id: 2 , title: "C3", seat_row: "3", seat_col: "3", price: "300"  )
ScreenSeat.create!(screen_id: 2 , title: "C4", seat_row: "3", seat_col: "3", price: "300"  )

ScreenSeat.create!(screen_id: 2 , title: "D1", seat_row: "4", seat_col: "1", price: "300"  )
ScreenSeat.create!(screen_id: 2 , title: "D2", seat_row: "4", seat_col: "2", price: "300"  )
ScreenSeat.create!(screen_id: 2 , title: "D3", seat_row: "4", seat_col: "3", price: "300"  )
ScreenSeat.create!(screen_id: 2 , title: "D4", seat_row: "4" ,seat_col: "4" ,price: "300"  )


