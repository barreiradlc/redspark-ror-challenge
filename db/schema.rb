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

ActiveRecord::Schema[7.2].define(version: 2024_09_02_135849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proponent_id"
    t.index ["proponent_id"], name: "index_adresses_on_proponent_id", unique: true
  end

  create_table "phones", force: :cascade do |t|
    t.integer "type"
    t.string "country_code"
    t.string "state_code"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "proponent_id"
    t.index ["proponent_id"], name: "index_phones_on_proponent_id"
  end

  create_table "proponents", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.date "birth_date"
    t.bigint "adress_id", null: false
    t.bigint "phones_id", null: false
    t.integer "wage"
    t.integer "inss_discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adress_id"], name: "index_proponents_on_adress_id"
    t.index ["phones_id"], name: "index_proponents_on_phones_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "proponents", "adresses"
  add_foreign_key "proponents", "phones", column: "phones_id"
end
