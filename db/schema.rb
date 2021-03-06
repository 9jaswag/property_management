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

ActiveRecord::Schema.define(version: 2019_05_27_135730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.text "street", null: false
    t.string "zipcode", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_addresses_on_city"
    t.index ["country"], name: "index_addresses_on_country"
    t.index ["state"], name: "index_addresses_on_state"
    t.index ["street"], name: "index_addresses_on_street"
    t.index ["zipcode"], name: "index_addresses_on_zipcode"
  end

  create_table "occupants", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id", "tenant_id"], name: "index_occupants_on_property_id_and_tenant_id", unique: true
    t.index ["property_id"], name: "index_occupants_on_property_id"
    t.index ["tenant_id"], name: "index_occupants_on_tenant_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["address_id"], name: "index_properties_on_address_id"
    t.index ["unit_id"], name: "index_properties_on_unit_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_type"], name: "index_units_on_unit_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "occupants", "properties"
  add_foreign_key "occupants", "tenants"
  add_foreign_key "properties", "addresses"
  add_foreign_key "properties", "units"
  add_foreign_key "properties", "users"
end
