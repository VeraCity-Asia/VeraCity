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

ActiveRecord::Schema.define(version: 2020_06_08_131006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.integer "number"
    t.date "validity"
    t.string "type"
    t.integer "listing_number"
    t.integer "code"
    t.string "authority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.string "authority"
    t.integer "number"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_licenses_on_supplier_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "product_id", null: false
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_messages_on_product_id"
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "amount"
    t.string "destination"
    t.integer "price"
    t.string "payment"
    t.date "date"
    t.boolean "approved"
    t.date "approved_date"
    t.bigint "user_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_offers_on_supplier_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "offers_products", id: false, force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "offer_id", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "type"
    t.integer "production_quantity"
    t.integer "minimum_order_quantity"
    t.bigint "supplier_id", null: false
    t.bigint "certification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["certification_id"], name: "index_products_on_certification_id"
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "country"
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verifications", force: :cascade do |t|
    t.boolean "veracity_approved"
    t.boolean "valid_registration_license"
    t.boolean "registration_completion"
    t.boolean "has_factory"
    t.boolean "has_international_certification"
    t.boolean "audit_completed"
    t.string "owner_name"
    t.boolean "has_production_capacity"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["supplier_id"], name: "index_verifications_on_supplier_id"
  end

  add_foreign_key "licenses", "suppliers"
  add_foreign_key "messages", "products"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "offers", "suppliers"
  add_foreign_key "offers", "users"
  add_foreign_key "products", "certifications"
  add_foreign_key "products", "suppliers"
  add_foreign_key "suppliers", "users"
  add_foreign_key "verifications", "suppliers"
end
