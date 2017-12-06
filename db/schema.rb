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

ActiveRecord::Schema.define(version: 20171205203313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "location"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "specialist_id"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "date"
    t.index ["specialist_id"], name: "index_appointments_on_specialist_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.string   "location"
    t.integer  "range"
    t.integer  "specialist_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date"
    t.index ["specialist_id"], name: "index_availabilities_on_specialist_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "specialist_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "comment"
    t.index ["specialist_id"], name: "index_favorites_on_specialist_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer "treatment_id"
    t.integer "appointment_id"
    t.index ["appointment_id"], name: "index_orders_on_appointment_id", using: :btree
    t.index ["treatment_id"], name: "index_orders_on_treatment_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.integer  "appointment_id"
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id", using: :btree
  end

  create_table "specialists", force: :cascade do |t|
    t.text     "bio"
    t.string   "work_experience"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "specialization"
    t.integer  "hourly_rate"
    t.index ["user_id"], name: "index_specialists_on_user_id", using: :btree
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  end

  create_table "treatments", force: :cascade do |t|
    t.string   "description"
    t.integer  "price"
    t.integer  "duration"
    t.string   "segment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "specialist_id"
    t.integer  "subcategory_id"
    t.index ["specialist_id"], name: "index_treatments_on_specialist_id", using: :btree
    t.index ["subcategory_id"], name: "index_treatments_on_subcategory_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo"
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "is_specialist",          default: false, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "specialists"
  add_foreign_key "appointments", "users"
  add_foreign_key "availabilities", "specialists"
  add_foreign_key "favorites", "specialists"
  add_foreign_key "favorites", "users"
  add_foreign_key "orders", "appointments"
  add_foreign_key "orders", "treatments"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "treatments", "specialists"
  add_foreign_key "treatments", "subcategories"
end
