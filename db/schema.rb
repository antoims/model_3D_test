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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_154142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acupoint_treatments", id: false, force: :cascade do |t|
    t.bigint "acupoint_id", null: false
    t.bigint "symptom_id", null: false
    t.index ["acupoint_id", "symptom_id"], name: "acupoint_symptom_index"
    t.index ["symptom_id", "acupoint_id"], name: "symptom_acupoint_index"
  end

  create_table "acupoints", force: :cascade do |t|
    t.string "name"
    t.string "coordinates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "essential_oils", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_elements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "essential_oil_id"
    t.bigint "acupoint_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acupoint_id"], name: "index_list_elements_on_acupoint_id"
    t.index ["essential_oil_id"], name: "index_list_elements_on_essential_oil_id"
    t.index ["user_id"], name: "index_list_elements_on_user_id"
  end

  create_table "oil_treatments", id: false, force: :cascade do |t|
    t.bigint "essential_oil_id", null: false
    t.bigint "symptom_id", null: false
    t.text "posology"
    t.index ["essential_oil_id", "symptom_id"], name: "oil_symptom_index"
    t.index ["symptom_id", "essential_oil_id"], name: "symptom_oil_index"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "list_elements", "acupoints"
  add_foreign_key "list_elements", "essential_oils"
  add_foreign_key "list_elements", "users"
end
