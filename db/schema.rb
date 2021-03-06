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

ActiveRecord::Schema.define(version: 2020_08_01_162605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coach_records", force: :cascade do |t|
    t.string "certification_number"
    t.string "specialty"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_coach_records_on_user_id"
  end

  create_table "consultation_notes", force: :cascade do |t|
    t.text "comment"
    t.bigint "consultation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "patient_rating"
    t.index ["consultation_id"], name: "index_consultation_notes_on_consultation_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "patient_id"
    t.bigint "coach_id"
    t.bigint "plan_id", null: false
    t.boolean "accepted_by_coach", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_consultations_on_coach_id"
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
    t.index ["plan_id"], name: "index_consultations_on_plan_id"
  end

  create_table "patient_records", force: :cascade do |t|
    t.string "description"
    t.string "gender"
    t.date "birth_date"
    t.string "weight"
    t.string "height"
    t.string "medical_condition"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.index ["user_id"], name: "index_patient_records_on_user_id"
  end

  create_table "plan_coaches", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coach_id"], name: "index_plan_coaches_on_coach_id"
    t.index ["plan_id"], name: "index_plan_coaches_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "duration"
    t.text "goal_description"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_consultations"
    t.index ["category_id"], name: "index_plans_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "coach_rating"
    t.bigint "consultation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consultation_id"], name: "index_reviews_on_consultation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind", default: "patient"
    t.float "rating"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "coach_records", "users"
  add_foreign_key "consultation_notes", "consultations"
  add_foreign_key "consultations", "plans"
  add_foreign_key "consultations", "users", column: "coach_id"
  add_foreign_key "consultations", "users", column: "patient_id"
  add_foreign_key "patient_records", "users"
  add_foreign_key "plan_coaches", "plans"
  add_foreign_key "plan_coaches", "users", column: "coach_id"
  add_foreign_key "plans", "categories"
  add_foreign_key "reviews", "consultations"
end
