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

ActiveRecord::Schema.define(version: 20160505225139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "username",                             null: false
    t.string   "password_digest",                      null: false
    t.string   "email"
    t.string   "name"
    t.datetime "birthdate",                            null: false
    t.string   "country"
    t.string   "city"
    t.string   "zip_code"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "ethnicity",             default: [],                array: true
    t.integer  "relationship_status",   default: 0,    null: false
    t.integer  "relationship_type"
    t.integer  "longest_relationship"
    t.integer  "height"
    t.integer  "body_type"
    t.integer  "hair_color"
    t.integer  "eye_color"
    t.integer  "diet"
    t.integer  "smoking"
    t.integer  "drinking"
    t.integer  "drugs"
    t.integer  "religion"
    t.integer  "religion_importance"
    t.integer  "zodiac_sign"
    t.integer  "education"
    t.integer  "education_status"
    t.integer  "ambitiousness"
    t.boolean  "has_children"
    t.integer  "wants_children"
    t.string   "catch"
    t.text     "summary"
    t.text     "current_life"
    t.text     "free_time"
    t.text     "favorite"
    t.text     "most_important"
    t.text     "talk_more"
    t.integer  "gender_interest",       default: 0,    null: false
    t.integer  "age_min",               default: 18,   null: false
    t.integer  "age_max",               default: 99,   null: false
    t.boolean  "desire_single",         default: true, null: false
    t.boolean  "desire_near",           default: true, null: false
    t.string   "relationship_interest", default: [],                array: true
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

end
