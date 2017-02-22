class MasterMigration < ActiveRecord::Migration
  def change

  create_table "block_lists", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name"
    t.integer  "user_id",     limit: 8
    t.boolean  "can_send",              default: true
    t.boolean  "can_receive",           default: true
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
    t.string   "cited_src"
    t.boolean  "approved",             default: true
    t.integer  "twitter_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["lesson_id"], name: "index_tweets_on_lesson_id", using: :btree
  add_index "tweets", ["twitter_id"], name: "index_tweets_on_twitter_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "how_found_tweechable"
    t.string   "encrypted_password",     default: "",    null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree



  end
end
