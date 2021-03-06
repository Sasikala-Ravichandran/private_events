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

ActiveRecord::Schema.define(version: 20150320234246) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "attendees_id"
    t.integer  "attending_events_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "attendances", ["attendees_id"], name: "index_attendances_on_attendees_id"
  add_index "attendances", ["attending_events_id"], name: "index_attendances_on_attending_events_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "creator_id"
  end

  add_index "events", ["creator_id"], name: "index_events_on_creator_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

end
