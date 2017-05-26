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

ActiveRecord::Schema.define(version: 20170525004553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charges", force: :cascade do |t|
    t.string "stripe_charge_id"
    t.integer "amount"
    t.integer "amount_refunded"
    t.string "balance_transaction"
    t.boolean "captured"
    t.integer "created"
    t.string "currency"
    t.string "description"
    t.boolean "success"
    t.bigint "source_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rate"
    t.index ["source_id"], name: "index_charges_on_source_id"
    t.index ["user_id"], name: "index_charges_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "stripe_customer_id"
    t.bigint "user_id"
    t.integer "account_balance"
    t.integer "created"
    t.string "currency"
    t.string "default_source"
    t.string "delinquent"
    t.string "description"
    t.string "email"
    t.string "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plays_on_user_id"
    t.index ["video_id"], name: "index_plays_on_video_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "stripe_source_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sources_on_customer_id"
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
    t.string "vimeo_token"
    t.string "vimeo_id"
  end

  create_table "videos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "wistia_id"
    t.integer "seconds_viewed"
    t.string "title"
    t.integer "length_in_seconds"
    t.integer "price_step", default: 0
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vimeo_id"
    t.string "thumbnail_url"
    t.boolean "displayable", default: false
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "charges", "sources"
  add_foreign_key "charges", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "plays", "users"
  add_foreign_key "plays", "videos"
  add_foreign_key "sources", "customers"
  add_foreign_key "videos", "users"
end
