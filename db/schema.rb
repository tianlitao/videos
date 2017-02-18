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

ActiveRecord::Schema.define(version: 20170218043528) do

  create_table "columns", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "english",    limit: 255
    t.string   "icon",       limit: 255
    t.string   "cover",      limit: 255
    t.text     "summary",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,     default: 0
    t.integer  "video_id",   limit: 4
    t.integer  "reply_id",   limit: 4
    t.integer  "vote",       limit: 4
    t.text     "content",    limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",                                           null: false
    t.string   "encrypted_password",     limit: 255, default: "",                                           null: false
    t.string   "nick_name",              limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "phone",                  limit: 255
    t.string   "role",                   limit: 255, default: "looker"
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,                                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "web_style",              limit: 255, default: "sidebar-mini wysihtml5-supported skin-blue"
    t.datetime "created_at",                                                                                null: false
    t.datetime "updated_at",                                                                                null: false
    t.string   "location",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "column_id",  limit: 4
    t.integer  "recommend",  limit: 4,     default: 0
    t.integer  "video_type", limit: 4
    t.string   "tv_code",    limit: 255,               null: false
    t.string   "title",      limit: 255
    t.string   "cover",      limit: 255
    t.string   "duration",   limit: 255
    t.text     "summary",    limit: 65535
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "videos", ["tv_code"], name: "index_videos_on_tv_code", unique: true, using: :btree

end
