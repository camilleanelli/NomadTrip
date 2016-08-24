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

ActiveRecord::Schema.define(version: 20160824111817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string   "accomodation_type"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "price"
    t.string   "link"
    t.integer  "number_of_persons"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "trip_id"
    t.index ["trip_id"], name: "index_accomodations_on_trip_id", using: :btree
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "transportation_id"
    t.string   "cloudinary_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "filepicker_url"
    t.index ["transportation_id"], name: "index_tickets_on_transportation_id", using: :btree
  end

  create_table "transportations", force: :cascade do |t|
    t.string   "transportation_type"
    t.string   "reference_number"
    t.string   "link"
    t.datetime "departure_datetime"
    t.string   "departure_city"
    t.string   "company"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "trip_id"
    t.decimal  "price"
    t.datetime "arrival_datetime"
    t.index ["trip_id"], name: "index_transportations_on_trip_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "destination"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "country"
    t.string   "cloudinary_id"
    t.integer  "person_number"
    t.string   "image_trip"
  end

  create_table "trips_users", id: false, force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nomadlist_username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "accomodations", "trips"
  add_foreign_key "tickets", "transportations"
  add_foreign_key "transportations", "trips"
end
