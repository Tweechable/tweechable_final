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

ActiveRecord::Schema.define(version: 20161111161547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.boolean "creator",   default: false
  end

  add_index "contributions", ["lesson_id"], name: "index_contributions_on_lesson_id", using: :btree
  add_index "contributions", ["user_id"], name: "index_contributions_on_user_id", using: :btree

  create_table "educatees", force: :cascade do |t|
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.string   "twitter_handle"
    t.boolean  "educated",       default: false
  end

  add_index "educatees", ["lesson_id"], name: "index_educatees_on_lesson_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "hash_tag"
    t.string   "category"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",    default: true
  end

  create_table "mentions", force: :cascade do |t|
    t.datetime "created_at"
    t.integer  "favorite_count"
    t.string   "lang"
    t.integer  "retweet_count"
    t.string   "text"
    t.string   "hash_tag"
    t.boolean  "replied",        default: false
    t.integer  "lesson_id"
    t.string   "handler"
  end

  add_index "mentions", ["lesson_id"], name: "index_mentions_on_lesson_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer "lesson_id"
    t.string  "text"
    t.boolean "approved",  default: true
  end

  add_index "tweets", ["lesson_id"], name: "index_tweets_on_lesson_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "how_found_tweechable"
    t.string   "encrypted_password",                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["encrypted_password"], name: "index_users_on_encrypted_password", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
