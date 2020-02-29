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

ActiveRecord::Schema.define(version: 20200229094728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "auction_item_id"
    t.integer  "auction_id"
    t.integer  "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["auction_id"], name: "index_auction_bids_on_auction_id", using: :btree
    t.index ["auction_item_id"], name: "index_auction_bids_on_auction_item_id", using: :btree
    t.index ["user_id"], name: "index_auction_bids_on_user_id", using: :btree
  end

  create_table "auction_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_bid"
    t.integer  "auction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_auction_items_on_auction_id", using: :btree
  end

  create_table "auctions", force: :cascade do |t|
    t.string   "name"
    t.datetime "auction_time"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "activation",   default: true
    t.index ["user_id"], name: "index_auctions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname",              default: "", null: false
    t.string   "lastname",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone_no"
    t.integer  "role",                   default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "auction_bids", "auction_items"
  add_foreign_key "auction_bids", "auctions"
  add_foreign_key "auction_bids", "users"
  add_foreign_key "auction_items", "auctions"
  add_foreign_key "auctions", "users"
end
