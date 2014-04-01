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

ActiveRecord::Schema.define(version: 20140401135353) do

  create_table "attached_files", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "editors", force: true do |t|
    t.string   "username"
    t.boolean  "is_superuser"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "editors", ["username"], name: "index_editors_on_username", using: :btree

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

  create_table "essay_awards", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "body_id"
  end

  add_index "essay_awards", ["body_id"], name: "index_essay_awards_on_body_id", using: :btree

  create_table "essay_files", force: true do |t|
    t.integer "essay_id"
    t.integer "attached_file_id"
  end

  add_index "essay_files", ["essay_id", "attached_file_id"], name: "index_essay_files_on_essay_id_and_attached_file_id", using: :btree

  create_table "essay_styles", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "essay_styles", ["slug"], name: "index_essay_styles_on_slug", unique: true, using: :btree

  create_table "essays", force: true do |t|
    t.integer  "issue_id"
    t.string   "slug"
    t.string   "title"
    t.string   "author"
    t.integer  "placement"
    t.text     "embed"
    t.string   "alt_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "essay_style_id"
    t.integer  "essay_award_id"
    t.integer  "body_id"
    t.integer  "alt_body_id"
    t.integer  "author_biography_id"
    t.integer  "works_cited_id"
    t.integer  "discussion_questions_id"
    t.integer  "instructor_resources_id"
  end

  add_index "essays", ["alt_body_id"], name: "index_essays_on_alt_body_id", using: :btree
  add_index "essays", ["author_biography_id"], name: "index_essays_on_author_biography_id", using: :btree
  add_index "essays", ["body_id"], name: "index_essays_on_body_id", using: :btree
  add_index "essays", ["discussion_questions_id"], name: "index_essays_on_discussion_questions_id", using: :btree
  add_index "essays", ["essay_award_id"], name: "index_essays_on_essay_award_id", using: :btree
  add_index "essays", ["essay_style_id"], name: "index_essays_on_essay_style_id", using: :btree
  add_index "essays", ["instructor_resources_id"], name: "index_essays_on_instructor_resources_id", using: :btree
  add_index "essays", ["issue_id"], name: "index_essays_on_issue_id", using: :btree
  add_index "essays", ["slug"], name: "index_essays_on_slug", unique: true, using: :btree
  add_index "essays", ["works_cited_id"], name: "index_essays_on_works_cited_id", using: :btree

  create_table "highlighted_essays", force: true do |t|
    t.integer  "issue_id"
    t.integer  "essay_style_id"
    t.integer  "essay_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "highlighted_essays", ["essay_id"], name: "index_highlighted_essays_on_essay_id", using: :btree
  add_index "highlighted_essays", ["essay_style_id"], name: "index_highlighted_essays_on_essay_style_id", using: :btree
  add_index "highlighted_essays", ["issue_id"], name: "index_highlighted_essays_on_issue_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.integer  "year"
    t.string   "slug"
    t.string   "title"
    t.boolean  "published"
    t.boolean  "is_pdf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editorial_notes_id"
    t.integer  "editorial_board_id"
    t.integer  "acknowledgements_id"
  end

  add_index "issues", ["acknowledgements_id"], name: "index_issues_on_acknowledgements_id", using: :btree
  add_index "issues", ["editorial_board_id"], name: "index_issues_on_editorial_board_id", using: :btree
  add_index "issues", ["editorial_notes_id"], name: "index_issues_on_editorial_notes_id", using: :btree
  add_index "issues", ["slug"], name: "index_issues_on_slug", unique: true, using: :btree

  create_table "markdown_content_images", id: false, force: true do |t|
    t.integer "markdown_content_id", null: false
    t.integer "image_id",            null: false
  end

  add_index "markdown_content_images", ["image_id", "markdown_content_id"], name: "image_md_index", using: :btree
  add_index "markdown_content_images", ["markdown_content_id", "image_id"], name: "md_image_index", using: :btree

  create_table "markdown_contents", force: true do |t|
    t.text     "content",    limit: 2147483647
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "content_id"
  end

  add_index "pages", ["content_id"], name: "index_pages_on_content_id", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

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
