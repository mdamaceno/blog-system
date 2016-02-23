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

ActiveRecord::Schema.define(version: 20160223162058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "blog_categories", ["slug"], name: "index_blog_categories_on_slug", unique: true, using: :btree

  create_table "blog_tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blog_tags", ["slug"], name: "index_blog_tags_on_slug", unique: true, using: :btree

  create_table "blog_users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "slug",                                   null: false
    t.string   "email",                                  null: false
    t.string   "password"
    t.string   "role",                 default: "guest"
    t.boolean  "status",               default: false
    t.boolean  "remember",             default: false
    t.datetime "remember_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "reset_password_at"
    t.boolean  "confirmed",            default: false
    t.datetime "confirmed_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "blog_users", ["email"], name: "index_blog_users_on_email", unique: true, using: :btree
  add_index "blog_users", ["slug"], name: "index_blog_users_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

end
