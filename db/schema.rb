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

ActiveRecord::Schema.define(version: 20160724173839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                                 null: false
    t.string   "email"
    t.string   "name"
    t.datetime "birthdate",                                null: false
    t.string   "country"
    t.string   "city"
    t.string   "zip_code"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "ethnicity",              default: [],                   array: true
    t.integer  "relationship_status",    default: 0,       null: false
    t.integer  "relationship_type"
    t.integer  "longest_relationship"
    t.integer  "height",                 default: 168
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
    t.integer  "gender_interest",        default: 0,       null: false
    t.integer  "age_min",                default: 18,      null: false
    t.integer  "age_max",                default: 99,      null: false
    t.boolean  "desire_single",          default: true,    null: false
    t.boolean  "desire_near",            default: true,    null: false
    t.string   "relationship_interest",  default: [],                   array: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.json     "tokens"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
