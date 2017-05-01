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

ActiveRecord::Schema.define(version: 20170501154314) do

  create_table "article_games", force: :cascade do |t|
    t.integer "article_id"
    t.integer "game_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.string   "seo_title"
    t.text     "seo_description"
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.date     "release_germany"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "usk"
    t.integer  "user_id"
  end

  create_table "google_news_keyword_articles", force: :cascade do |t|
    t.integer "google_news_keyword_id"
    t.integer "article_id"
  end

  create_table "google_news_keywords", force: :cascade do |t|
    t.string "news_keyword", limit: 40
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "is_admin",        default: false
  end

end
