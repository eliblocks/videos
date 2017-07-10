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

ActiveRecord::Schema.define(version: 20170707004553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

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

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seconds"
    t.bigint "video_id"
    t.index ["video_id"], name: "index_payments_on_video_id"
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

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "videos", force: :cascade do |t|
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
    t.integer "balance"
    t.string "imdb_id"
    t.decimal "imdb_rating", precision: 2, scale: 1
    t.integer "num_votes"
    t.datetime "published_at"
    t.bigint "show_id"
    t.index ["show_id"], name: "index_videos_on_show_id"
  end

  add_foreign_key "charges", "users"
  add_foreign_key "payments", "videos"
  add_foreign_key "plays", "users"
  add_foreign_key "plays", "videos"
  add_foreign_key "videos", "shows"
end
