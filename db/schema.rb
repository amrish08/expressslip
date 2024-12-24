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

ActiveRecord::Schema[7.1].define(version: 2024_12_24_181051) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "user_id", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_admin_users_on_user_id", unique: true
  end

  create_table "deposit_requests", force: :cascade do |t|
    t.decimal "amount"
    t.string "payment_system"
    t.string "reference_no"
    t.date "deposited_date"
    t.string "deposit_slip"
    t.text "remarks"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_deposit_requests_on_user_id"
  end

  create_table "night_slips", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "country_traveling_to"
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "gender"
    t.string "marital_status"
    t.string "nationality"
    t.string "passport_number"
    t.string "confirm_passport"
    t.date "passport_issue_date"
    t.date "passport_expiry_date"
    t.string "visa_type"
    t.string "national_id"
    t.string "position_applied_for"
    t.text "remarks"
    t.boolean "confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slip_payment", force: :cascade do |t|
    t.string "payment_link"
    t.text "remarks"
  end

  create_table "slip_payments", force: :cascade do |t|
    t.string "payment_link"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slips", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "country_traveling_to"
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "gender"
    t.string "marital_status"
    t.string "nationality"
    t.string "passport_number"
    t.string "confirm_passport"
    t.date "passport_issue_date"
    t.date "passport_expiry_date"
    t.string "visa_type"
    t.string "national_id"
    t.string "position_applied_for"
    t.text "remarks"
    t.boolean "confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "slip_type"
    t.integer "user_id"
    t.index ["user_id"], name: "index_slips_on_user_id"
  end

  create_table "special_slips", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "country_traveling_to"
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "gender"
    t.string "marital_status"
    t.string "nationality"
    t.string "passport_number"
    t.string "confirm_passport"
    t.date "passport_issue_date"
    t.date "passport_expiry_date"
    t.string "visa_type"
    t.string "national_id"
    t.string "position_applied_for"
    t.text "remarks"
    t.boolean "confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "userid"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "deposit_requests", "users"
  add_foreign_key "slips", "users"
end
