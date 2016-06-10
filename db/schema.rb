# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160610162131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "status",        default: "0"
    t.integer  "spaces_amount", default: 1
    t.boolean  "chamber",       default: false
    t.boolean  "electric",      default: false
    t.integer  "vendor_id"
    t.integer  "event_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "applications", ["event_id"], name: "index_applications_on_event_id", using: :btree
  add_index "applications", ["vendor_id"], name: "index_applications_on_vendor_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_spaces", force: :cascade do |t|
    t.decimal  "number"
    t.string   "description"
    t.boolean  "electric",    default: false
    t.integer  "vendor_id"
    t.integer  "event_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "event_spaces", ["event_id"], name: "index_event_spaces_on_event_id", using: :btree
  add_index "event_spaces", ["vendor_id"], name: "index_event_spaces_on_vendor_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "season"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business_name"
    t.string   "email"
    t.text     "product_description"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vendors_categories", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "category_id"
  end

  add_index "vendors_categories", ["category_id"], name: "index_vendors_categories_on_category_id", using: :btree
  add_index "vendors_categories", ["vendor_id"], name: "index_vendors_categories_on_vendor_id", using: :btree

  add_foreign_key "applications", "events"
  add_foreign_key "applications", "vendors"
  add_foreign_key "event_spaces", "events"
  add_foreign_key "event_spaces", "vendors"
  add_foreign_key "vendors_categories", "categories"
  add_foreign_key "vendors_categories", "vendors"
end
