# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150524214144) do

  create_table "event_members", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "role"
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "event_members", ["event_id"], name: "index_event_members_on_event_id"
  add_index "event_members", ["user_id"], name: "index_event_members_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "price_for_general"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "venue_id"
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"
  add_index "events", ["venue_id"], name: "index_events_on_venue_id"

  create_table "followers", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendee_id"
    t.integer  "friender_id"
    t.boolean  "confirmed",   default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "shows", force: :cascade do |t|
    t.datetime "date"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time"
  end

  add_index "shows", ["event_id"], name: "index_shows_on_event_id"

  create_table "tickets", force: :cascade do |t|
    t.integer  "num_of_general"
    t.integer  "show_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tickets", ["show_id"], name: "index_tickets_on_show_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                            null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profession"
    t.text     "description"
    t.string   "avatar"
    t.boolean  "arts_worker",      default: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "venues", force: :cascade do |t|
    t.integer  "num_of_seats"
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.decimal  "latitude",     precision: 9, scale: 6
    t.decimal  "longitude",    precision: 9, scale: 6
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id"

  create_table "videos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "youtube_id"
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id"

end
