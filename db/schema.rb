# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_06_110210) do
  create_table "plans", charset: "utf8", force: :cascade do |t|
    t.string "destination", null: false
    t.text "text", null: false
    t.integer "prefecture_id", null: false
    t.string "city"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "records", charset: "utf8", force: :cascade do |t|
    t.string "destination", null: false
    t.string "text", null: false
    t.integer "prefecture_id", null: false
    t.string "city"
    t.date "start_date"
    t.date "end_date"
    t.bigint "plan_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_records_on_plan_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "spots", charset: "utf8", force: :cascade do |t|
    t.integer "icon_id", null: false
    t.string "spot_name", null: false
    t.text "information"
    t.integer "prefecture_id", null: false
    t.string "address"
    t.decimal "latitude", precision: 10, scale: 8
    t.decimal "longitude", precision: 10, scale: 7
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", default: "", null: false
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

  add_foreign_key "plans", "users"
  add_foreign_key "records", "plans"
  add_foreign_key "records", "users"
  add_foreign_key "spots", "users"
end
