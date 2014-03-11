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

ActiveRecord::Schema.define(version: 20140311140044) do

  create_table "attached_files", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "error_logs", force: true do |t|
    t.string   "netid"
    t.string   "path"
    t.text     "message"
    t.text     "params"
    t.text     "stack_trace"
    t.datetime "created_at"
    t.string   "state"
    t.text     "user_agent"
    t.string   "exception_class"
  end

  create_table "essay_files", force: true do |t|
    t.integer "essay_id"
    t.integer "attached_file_id"
  end

  add_index "essay_files", ["essay_id", "attached_file_id"], name: "index_essay_files_on_essay_id_and_attached_file_id", using: :btree

  create_table "essay_styles", force: true do |t|
    t.string   "slug"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "essay_styles", ["slug"], name: "index_essay_styles_on_slug", unique: true, using: :btree

  create_table "essays", force: true do |t|
    t.integer  "issue_id"
    t.string   "slug"
    t.text     "data",       limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "essays", ["issue_id"], name: "index_essays_on_issue_id", using: :btree
  add_index "essays", ["slug"], name: "index_essays_on_slug", unique: true, using: :btree

  create_table "issues", force: true do |t|
    t.integer  "year"
    t.string   "slug"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["slug"], name: "index_issues_on_slug", unique: true, using: :btree

  create_table "pages", force: true do |t|
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages_images", force: true do |t|
    t.integer  "page_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages_images", ["page_id"], name: "index_pages_images_on_page_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                       null: false
    t.integer  "sign_in_count",      default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
