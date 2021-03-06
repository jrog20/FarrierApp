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

ActiveRecord::Schema.define(version: 2021_01_16_020316) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.text "comments"
    t.integer "farrier_id", null: false
    t.integer "horse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date"
    t.integer "barn_id"
    t.integer "owner_id"
    t.index ["farrier_id"], name: "index_appointments_on_farrier_id"
    t.index ["horse_id"], name: "index_appointments_on_horse_id"
  end

  create_table "barns", force: :cascade do |t|
    t.string "name"
    t.string "manager_name"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "farriers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "company_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "horses", force: :cascade do |t|
    t.string "name"
    t.boolean "flagged"
    t.boolean "front_shoes"
    t.boolean "hind_shoes"
    t.boolean "winter_shoes"
    t.boolean "pads"
    t.integer "shoe_size"
    t.text "temperament"
    t.string "schedule"
    t.text "comments"
    t.integer "farrier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id"
    t.integer "barn_id"
    t.index ["farrier_id"], name: "index_horses_on_farrier_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "farriers"
  add_foreign_key "appointments", "horses"
  add_foreign_key "horses", "farriers"
end
