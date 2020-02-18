# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_02_18_223615) do
=======
ActiveRecord::Schema.define(version: 2020_02_18_190502) do
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "reserve_price"
    t.datetime "ends_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
<<<<<<< HEAD
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_auctions_on_user_id"
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
  end

  create_table "bids", force: :cascade do |t|
    t.integer "bid_amount"
    t.bigint "auction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
<<<<<<< HEAD
    t.bigint "user_id", null: false
    t.index ["auction_id"], name: "index_bids_on_auction_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_admin", default: false
  end

  add_foreign_key "auctions", "users"
  add_foreign_key "bids", "auctions"
  add_foreign_key "bids", "users"
=======
    t.index ["auction_id"], name: "index_bids_on_auction_id"
  end

  add_foreign_key "bids", "auctions"
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
end
