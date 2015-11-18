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

ActiveRecord::Schema.define(version: 20151026202456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booths", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "address1",    limit: 255
    t.string   "address2",    limit: 255
    t.string   "city",        limit: 255
    t.string   "state",       limit: 255
    t.string   "zipcode",     limit: 255
    t.string   "email",       limit: 255
    t.string   "phone",       limit: 255
    t.text     "description"
    t.datetime "start_date"
    t.datetime "stop_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "booths", ["user_id"], name: "index_booths_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "booth_id"
    t.integer  "category_id"
  end

  add_index "items", ["booth_id"], name: "index_items_on_booth_id", using: :btree
  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end