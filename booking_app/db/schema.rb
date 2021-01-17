# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_17_103121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "booking_date"
    t.bigint "screen_seat_id"
    t.bigint "screen_slot_id"
    t.bigint "screen_movie_id"
    t.float "price"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screen_movie_id"], name: "index_bookings_on_screen_movie_id"
    t.index ["screen_seat_id"], name: "index_bookings_on_screen_seat_id"
    t.index ["screen_slot_id"], name: "index_bookings_on_screen_slot_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screen_movies", force: :cascade do |t|
    t.bigint "screen_id"
    t.bigint "movie_id"
    t.date "on_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_screen_movies_on_movie_id"
    t.index ["screen_id"], name: "index_screen_movies_on_screen_id"
  end

  create_table "screen_seats", force: :cascade do |t|
    t.string "title"
    t.bigint "screen_id"
    t.string "seat_row"
    t.string "seat_col"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screen_id"], name: "index_screen_seats_on_screen_id"
  end

  create_table "screen_slots", force: :cascade do |t|
    t.string "title"
    t.string "slot_time"
    t.bigint "screen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screen_id"], name: "index_screen_slots_on_screen_id"
  end

  create_table "screens", force: :cascade do |t|
    t.string "title"
    t.integer "seat_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "screen_movies"
  add_foreign_key "bookings", "screen_seats"
  add_foreign_key "bookings", "screen_slots"
  add_foreign_key "screen_movies", "movies"
  add_foreign_key "screen_movies", "screens"
  add_foreign_key "screen_seats", "screens"
  add_foreign_key "screen_slots", "screens"
end
