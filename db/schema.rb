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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_144706) do
  create_table "pet_breeds", charset: "utf8mb4", force: :cascade do |t|
    t.string "pet_type", limit: 100, null: false
    t.string "breed_name", limit: 200, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", limit: 100, default: ""
    t.string "pet_type", limit: 100, default: "dog", null: false
    t.string "breed", limit: 200, default: "undefined", null: false
    t.string "breed_other", limit: 100
    t.string "gender", limit: 100, default: "undefined", null: false
    t.decimal "weight_kg", precision: 10, default: "0"
    t.string "neutered", default: "unknown", null: false
    t.datetime "birthday"
    t.integer "age"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "services", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.string "name", limit: 200, default: ""
    t.string "service_type", limit: 200, null: false
    t.text "description"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_services_on_name"
    t.index ["service_type"], name: "index_services_on_service_type"
    t.index ["store_id"], name: "index_services_on_store_id"
  end

  create_table "stores", charset: "utf8mb4", force: :cascade do |t|
    t.string "name_eng", limit: 200, default: ""
    t.string "name_kr", limit: 100
    t.string "name_jp", limit: 200, default: ""
    t.text "description"
    t.string "pet_type", limit: 50, null: false
    t.boolean "pickup_available", default: false, null: false
    t.string "website_url"
    t.string "status", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_eng"], name: "index_stores_on_name_eng"
    t.index ["name_jp"], name: "index_stores_on_name_jp"
    t.index ["pickup_available"], name: "index_stores_on_pickup_available"
    t.index ["status"], name: "index_stores_on_status"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
