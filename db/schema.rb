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

ActiveRecord::Schema.define(version: 20160621013228) do

  create_table "attached_files", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.string   "title",             limit: 255
    t.text     "body",              limit: 65535
    t.integer  "essay_id",          limit: 4
    t.string   "file_relationship", limit: 255
  end

  add_index "attached_files", ["essay_id"], name: "index_attached_files_on_essay_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.string   "slug",                     limit: 255
    t.string   "title",                    limit: 255
    t.text     "data",                     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "body_id",                  limit: 4
    t.string   "cover_image_file_name",    limit: 255
    t.string   "cover_image_content_type", limit: 255
    t.integer  "cover_image_file_size",    limit: 4
    t.datetime "cover_image_updated_at"
  end

  add_index "awards", ["body_id"], name: "index_awards_on_body_id", using: :btree

  create_table "editors", force: :cascade do |t|
    t.string   "username",     limit: 255
    t.boolean  "is_superuser"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "editors", ["username"], name: "index_editors_on_username", using: :btree

  create_table "error_logs", force: :cascade do |t|
    t.string   "netid",           limit: 255
    t.string   "path",            limit: 255
    t.text     "message",         limit: 65535
    t.text     "params",          limit: 65535
    t.text     "stack_trace",     limit: 65535
    t.datetime "created_at"
    t.string   "state",           limit: 255
    t.text     "user_agent",      limit: 65535
    t.string   "exception_class", limit: 255
  end

  create_table "essay_awards", force: :cascade do |t|
    t.integer "essay_id",  limit: 4
    t.integer "award_id",  limit: 4
    t.integer "placement", limit: 4
  end

  add_index "essay_awards", ["award_id"], name: "index_essay_awards_on_award_id", using: :btree
  add_index "essay_awards", ["essay_id"], name: "index_essay_awards_on_essay_id", using: :btree

  create_table "essay_styles", force: :cascade do |t|
    t.string   "slug",                     limit: 255
    t.string   "title",                    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_image_file_name",    limit: 255
    t.string   "cover_image_content_type", limit: 255
    t.integer  "cover_image_file_size",    limit: 4
    t.datetime "cover_image_updated_at"
    t.integer  "body_id",                  limit: 4
  end

  add_index "essay_styles", ["body_id"], name: "index_essay_styles_on_body_id", using: :btree
  add_index "essay_styles", ["slug"], name: "index_essay_styles_on_slug", unique: true, using: :btree

  create_table "essays", force: :cascade do |t|
    t.integer  "issue_id",                  limit: 4
    t.string   "slug",                      limit: 255
    t.string   "title",                     limit: 255
    t.string   "author",                    limit: 255
    t.text     "embed",                     limit: 65535
    t.string   "alt_title",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "essay_style_id",            limit: 4
    t.integer  "body_id",                   limit: 4
    t.integer  "alt_body_id",               limit: 4
    t.integer  "author_biography_id",       limit: 4
    t.integer  "works_cited_id",            limit: 4
    t.integer  "discussion_questions_id",   limit: 4
    t.integer  "instructor_resources_id",   limit: 4
    t.boolean  "published"
    t.string   "cover_image_file_name",     limit: 255
    t.string   "cover_image_content_type",  limit: 255
    t.integer  "cover_image_file_size",     limit: 4
    t.datetime "cover_image_updated_at"
    t.text     "cover_image_credit",        limit: 65535
    t.string   "cover_image_alt",           limit: 255
    t.string   "author_image_file_name",    limit: 255
    t.string   "author_image_content_type", limit: 255
    t.integer  "author_image_file_size",    limit: 4
    t.datetime "author_image_updated_at"
    t.string   "published_medium",          limit: 255
    t.integer  "embed_id",                  limit: 4
    t.integer  "wowza_media_id",            limit: 4
  end

  add_index "essays", ["alt_body_id"], name: "index_essays_on_alt_body_id", using: :btree
  add_index "essays", ["author_biography_id"], name: "index_essays_on_author_biography_id", using: :btree
  add_index "essays", ["body_id"], name: "index_essays_on_body_id", using: :btree
  add_index "essays", ["discussion_questions_id"], name: "index_essays_on_discussion_questions_id", using: :btree
  add_index "essays", ["embed_id"], name: "index_essays_on_embed_id", using: :btree
  add_index "essays", ["essay_style_id"], name: "index_essays_on_essay_style_id", using: :btree
  add_index "essays", ["instructor_resources_id"], name: "index_essays_on_instructor_resources_id", using: :btree
  add_index "essays", ["issue_id"], name: "index_essays_on_issue_id", using: :btree
  add_index "essays", ["slug"], name: "index_essays_on_slug", unique: true, using: :btree
  add_index "essays", ["works_cited_id"], name: "index_essays_on_works_cited_id", using: :btree
  add_index "essays", ["wowza_media_id"], name: "index_essays_on_wowza_media_id", using: :btree

  create_table "highlighted_essays", force: :cascade do |t|
    t.integer  "issue_id",       limit: 4
    t.integer  "essay_style_id", limit: 4
    t.integer  "essay_id",       limit: 4
    t.text     "body",           limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "highlighted_essays", ["essay_id"], name: "index_highlighted_essays_on_essay_id", using: :btree
  add_index "highlighted_essays", ["essay_style_id"], name: "index_highlighted_essays_on_essay_style_id", using: :btree
  add_index "highlighted_essays", ["issue_id"], name: "index_highlighted_essays_on_issue_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "year",                           limit: 4
    t.string   "slug",                           limit: 255
    t.string   "title",                          limit: 255
    t.boolean  "published"
    t.boolean  "is_pdf"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editorial_notes_id",             limit: 4
    t.integer  "editorial_board_id",             limit: 4
    t.integer  "acknowledgements_id",            limit: 4
    t.string   "old_cover_image_file_name",      limit: 255
    t.string   "old_cover_image_content_type",   limit: 255
    t.integer  "old_cover_image_file_size",      limit: 4
    t.datetime "old_cover_image_updated_at"
    t.string   "pdf_file_name",                  limit: 255
    t.string   "pdf_content_type",               limit: 255
    t.integer  "pdf_file_size",                  limit: 4
    t.datetime "pdf_updated_at"
    t.string   "large_cover_image_file_name",    limit: 255
    t.string   "large_cover_image_content_type", limit: 255
    t.integer  "large_cover_image_file_size",    limit: 4
    t.datetime "large_cover_image_updated_at"
    t.string   "small_cover_image_file_name",    limit: 255
    t.string   "small_cover_image_content_type", limit: 255
    t.integer  "small_cover_image_file_size",    limit: 4
    t.datetime "small_cover_image_updated_at"
    t.string   "cover_image_credit",             limit: 255
    t.string   "cover_image_alt",                limit: 255
  end

  add_index "issues", ["acknowledgements_id"], name: "index_issues_on_acknowledgements_id", using: :btree
  add_index "issues", ["editorial_board_id"], name: "index_issues_on_editorial_board_id", using: :btree
  add_index "issues", ["editorial_notes_id"], name: "index_issues_on_editorial_notes_id", using: :btree
  add_index "issues", ["slug"], name: "index_issues_on_slug", unique: true, using: :btree

  create_table "markdown_content_images", id: false, force: :cascade do |t|
    t.integer "markdown_content_id", limit: 4, null: false
    t.integer "image_id",            limit: 4, null: false
  end

  add_index "markdown_content_images", ["image_id", "markdown_content_id"], name: "image_md_index", using: :btree
  add_index "markdown_content_images", ["markdown_content_id", "image_id"], name: "md_image_index", using: :btree

  create_table "markdown_contents", force: :cascade do |t|
    t.text     "content",    limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "path",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "content_id", limit: 4
  end

  add_index "pages", ["content_id"], name: "index_pages_on_content_id", using: :btree
  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255,             null: false
    t.integer  "sign_in_count",      limit: 4,   default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255,   null: false
    t.integer  "item_id",    limit: 4,     null: false
    t.string   "event",      limit: 255,   null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object",     limit: 65535
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
