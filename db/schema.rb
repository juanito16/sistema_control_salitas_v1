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

ActiveRecord::Schema.define(version: 20131008045139) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name_country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.integer  "company_id"
    t.integer  "country_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree
  add_index "employees", ["country_id"], name: "index_employees_on_country_id", using: :btree

  create_table "parlos", force: true do |t|
    t.string   "name_parlo"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parlos", ["country_id"], name: "index_parlos_on_country_id", using: :btree

  create_table "reservations", force: true do |t|
    t.integer  "parlo_id"
    t.integer  "employee_id"
    t.integer  "status"
    t.date     "date_reservation"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["employee_id"], name: "index_reservations_on_employee_id", using: :btree
  add_index "reservations", ["parlo_id"], name: "index_reservations_on_parlo_id", using: :btree

end
