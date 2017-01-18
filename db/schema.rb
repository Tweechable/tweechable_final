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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170104192318) do
=======
ActiveRecord::Schema.define(version: 20161111161547) do
>>>>>>> master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "block_lists", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.boolean  "can_send",              default: true
    t.boolean  "can_receive",           default: true
    t.integer  "user_id",     limit: 8
  end

  add_index "block_lists", ["user_id"], name: "index_block_lists_on_user_id", using: :btree

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
    t.string   "intro"
    t.string   "thread_link"
    t.datetime "posted_at"
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
    t.integer  "lesson_id"
    t.string   "text"
    t.boolean  "approved",             default: true
    t.string   "cited_src"
    t.integer  "twitter_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["lesson_id"], name: "index_tweets_on_lesson_id", using: :btree
  add_index "tweets", ["twitter_id"], name: "index_tweets_on_twitter_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.boolean  "admin",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "how_found_tweechable"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
