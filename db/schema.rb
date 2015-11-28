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

ActiveRecord::Schema.define(version: 20151128132645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boundaries", force: true do |t|
    t.integer  "profile_id"
    t.string   "rights"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boundaries", ["profile_id"], name: "index_boundaries_on_profile_id", using: :btree

  create_table "boundary_details", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "en_front_page_contents", force: true do |t|
    t.string   "home_toolbar_phone_number"
    t.string   "home_toolbar_email"
    t.string   "home_toolbar_language_fr"
    t.string   "home_toolbar_language_en"
    t.string   "home_toolbar_registration"
    t.string   "home_toolbar_my_account"
    t.string   "home_main_menu_home"
    t.string   "home_main_menu_compendium"
    t.string   "home_main_menu_blog"
    t.string   "home_main_menu_gallery"
    t.string   "home_main_menu_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fr_front_page_contents", force: true do |t|
    t.string   "home_toolbar_phone_number"
    t.string   "home_toolbar_email"
    t.string   "home_toolbar_language_fr"
    t.string   "home_toolbar_language_en"
    t.string   "home_toolbar_registration"
    t.string   "home_toolbar_my_account"
    t.string   "home_main_menu_home"
    t.string   "home_main_menu_compendium"
    t.string   "home_main_menu_blog"
    t.string   "home_main_menu_gallery"
    t.string   "home_main_menu_contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortcut",   limit: 20
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number",           limit: 20
    t.string   "mobile_number",          limit: 20
    t.string   "identity_card_id"
    t.string   "address"
    t.integer  "profile_id"
    t.boolean  "published"
    t.integer  "published_by"
    t.datetime "published_at"
    t.integer  "unpublished_by"
    t.datetime "unpublished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "created_by"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
