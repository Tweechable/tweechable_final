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

ActiveRecord::Schema.define(version: 0) do

  create_table "educatees", force: :cascade do |t|
    t.integer "lesson_id"
    t.boolean "educated",       default: false
    t.string  "hash_tag"
    t.string  "twitter_handle"
  end

  add_index "educatees", ["lesson_id"], name: "index_educatees_on_lesson_id"

  create_table "lessons", force: :cascade do |t|
    t.string   "hash_tag"
    t.datetime "created_at"
    t.string   "t1"
    t.string   "t2"
    t.string   "t3"
    t.string   "t4"
    t.string   "t5"
    t.string   "t6"
    t.string   "t7"
    t.string   "t8"
    t.string   "t9"
    t.string   "t10"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "lesson_id"
    t.string  "text"
  end

  add_index "tweets", ["lesson_id"], name: "index_tweets_on_lesson_id"

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password"
  end

end
