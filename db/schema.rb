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

ActiveRecord::Schema.define(version: 20170817221448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: :cascade do |t|
    t.string "gateway_charge_id"
    t.integer "amount"
    t.integer "amount_refunded"
    t.string "balance_transaction"
    t.boolean "captured"
    t.integer "created"
    t.string "currency"
    t.string "description"
    t.boolean "success"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seconds"
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seconds"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "length_in_seconds", default: 0
    t.index ["user_id"], name: "index_plays_on_user_id"
    t.index ["video_id"], name: "index_plays_on_video_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "facebook_id"
    t.string "full_name"
    t.string "first_name"
    t.string "last_name"
    t.string "age_range"
    t.string "link"
    t.string "gender"
    t.string "locale"
    t.string "image"
    t.string "timezone"
    t.string "updated_time"
    t.boolean "verified"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "balance", default: 0
    t.string "paypal_email"
    t.boolean "paypal_confirmed", default: false
    t.boolean "admin", default: false
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "wistia_id"
    t.integer "seconds_viewed", default: 0
    t.string "title"
    t.integer "length_in_seconds"
    t.integer "price_step", default: 0
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wistia_delivery_id"
    t.boolean "approved", default: false
    t.datetime "published_at"
    t.bigint "section_id"
    t.string "image"
    t.integer "position"
    t.index ["section_id"], name: "index_videos_on_section_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "charges", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "plays", "users"
  add_foreign_key "plays", "videos"
  add_foreign_key "sections", "courses"
  add_foreign_key "videos", "sections"
  add_foreign_key "videos", "users"
end
