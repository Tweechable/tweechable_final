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

ActiveRecord::Schema.define(version: 20160520175736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educatees", force: :cascade do |t|
    t.integer "lesson_id"
    t.string  "hash_tag"
    t.boolean "educated",       default: false
    t.string  "twitter_handle"
  end

  add_index "educatees", ["lesson_id"], name: "index_educatees_on_lesson_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "hash_tag"
    t.datetime "created_at"
    t.string   "category"
    t.text     "description"
    t.boolean  "approved",    default: false
  end

  create_table "mentions", force: :cascade do |t|
    t.string  "in_reply_to_screen_name"
    t.integer "favorite_count"
    t.integer "in_reply_to_user_id"
    t.string  "lang"
    t.integer "retweet_count"
    t.string  "text"
    t.string  "hash_tag"
  end

  add_index "mentions", ["in_reply_to_user_id"], name: "index_mentions_on_in_reply_to_user_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer "lesson_id"
    t.string  "text"
    t.boolean "approved",  default: false
  end

  add_index "tweets", ["lesson_id"], name: "index_tweets_on_lesson_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
  end

end
