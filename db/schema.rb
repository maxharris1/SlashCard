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

ActiveRecord::Schema.define(version: 20190205193846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.text "discount", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.index ["vendor_id"], name: "index_discounts_on_vendor_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "description", default: "", null: false
    t.string "amb_name", default: "", null: false
    t.string "amb_email", default: "", null: false
    t.string "amb_phone", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "school", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "unique_session_id", limit: 20
    t.boolean "has_Business"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone_number", default: "", null: false
    t.text "description", default: "", null: false
    t.string "school", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "school_id"
    t.float "latitude"
    t.float "longitude"
  end

end
