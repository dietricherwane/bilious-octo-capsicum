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

ActiveRecord::Schema.define(version: 20160125185751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.text     "fr_title"
    t.text     "en_title"
    t.text     "fr_content"
    t.text     "en_content"
    t.datetime "published_at"
    t.string   "description_image_file_name"
    t.string   "description_image_content_type"
    t.integer  "description_image_file_size"
    t.datetime "description_image_updated_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.date     "publication_date"
    t.integer  "activity_category_id"
  end

  create_table "activity_attachments", force: true do |t|
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
  end

  create_table "activity_categories", force: true do |t|
    t.string   "fr_title"
    t.string   "en_title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.date     "publication_date"
    t.string   "fr_title_activity_section"
    t.string   "en_title_activity_section"
  end

  create_table "activity_fields", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ahoy_events", id: :uuid, force: true do |t|
    t.uuid     "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.json     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "blog_categories", force: true do |t|
    t.string   "title"
    t.boolean  "published"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", force: true do |t|
    t.integer  "blog_theme_id"
    t.text     "content"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "blog_themes", force: true do |t|
    t.integer  "blog_category_id"
    t.string   "title"
    t.text     "content"
    t.integer  "created_by"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descriptive_image_file_name"
    t.string   "descriptive_image_content_type"
    t.integer  "descriptive_image_file_size"
    t.datetime "descriptive_image_updated_at"
  end

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

  create_table "companies", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "name"
    t.string   "shortcut"
    t.integer  "activity_category_id"
    t.integer  "juridical_status_id"
    t.string   "commercial_id"
    t.integer  "number_of_employee_id"
    t.float    "revenue"
    t.string   "telephone"
    t.string   "fax"
    t.string   "website"
    t.string   "address"
    t.integer  "country"
    t.string   "city"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_field_id"
    t.integer  "country_id"
    t.integer  "profile_id"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "contract_types", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.boolean  "published"
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
    t.string   "home_slider_slide1_text1"
    t.string   "home_slider_slide1_text2"
    t.string   "home_slider_slide1_text3"
    t.string   "home_slider_slide2_text1"
    t.string   "home_slider_slide2_text2"
    t.string   "home_slider_slide2_text3"
    t.string   "home_slider_slide2_text4"
    t.string   "home_slider_slide2_text5"
    t.string   "home_slider_slide2_text6"
    t.string   "home_slider_slide3_text1"
    t.string   "home_slider_slide3_text2"
    t.string   "home_slider_slide3_text3"
    t.string   "home_slider_slide3_text4"
    t.string   "home_slider_slide4_text1"
    t.string   "home_slider_slide4_text2"
    t.string   "home_slider_slide4_text3"
    t.string   "home_slider_slide4_text4"
    t.string   "home_slider_slide4_text5"
    t.string   "home_top_content_title"
    t.text     "home_top_content_quotation"
    t.string   "home_main_content_welcome_word_title"
    t.text     "home_main_content_welcome_word_content"
    t.string   "home_main_content_block1_title"
    t.string   "home_main_content_block1_image_file_name"
    t.string   "home_main_content_block1_image_content_type"
    t.integer  "home_main_content_block1_image_file_size"
    t.datetime "home_main_content_block1_image_updated_at"
    t.text     "home_main_content_block1_content"
    t.string   "home_main_content_block2_title"
    t.string   "home_main_content_block2_image_file_name"
    t.string   "home_main_content_block2_image_content_type"
    t.integer  "home_main_content_block2_image_file_size"
    t.datetime "home_main_content_block2_image_updated_at"
    t.text     "home_main_content_block2_content"
    t.string   "home_main_content_block3_title"
    t.string   "home_main_content_block3_image_file_name"
    t.string   "home_main_content_block3_image_content_type"
    t.integer  "home_main_content_block3_image_file_size"
    t.datetime "home_main_content_block3_image_updated_at"
    t.text     "home_main_content_block3_content"
    t.string   "home_main_content_read_more"
    t.text     "home_footer_block1"
    t.text     "home_footer_block2"
    t.text     "home_footer_block3"
    t.text     "home_footer_block4"
    t.text     "home_footer_copyright"
    t.string   "contact_main_content_title"
    t.text     "contact_main_content_intro_text"
    t.text     "contact_main_content_detailed_contacts"
    t.string   "contact_main_content_form_field_name"
    t.string   "contact_main_content_form_field_email"
    t.string   "contact_main_content_form_field_subject"
    t.text     "contact_main_content_form_field_message"
    t.string   "contact_main_content_form_field_validation_button"
    t.string   "compendium_top_content_title"
    t.string   "compendium_top_content_block1_image_file_name"
    t.string   "compendium_top_content_block1_image_content_type"
    t.integer  "compendium_top_content_block1_image_file_size"
    t.datetime "compendium_top_content_block1_image_updated_at"
    t.text     "compendium_top_content_block1_content"
    t.string   "compendium_top_content_block2_image_file_name"
    t.string   "compendium_top_content_block2_image_content_type"
    t.integer  "compendium_top_content_block2_image_file_size"
    t.datetime "compendium_top_content_block2_image_updated_at"
    t.text     "compendium_top_content_block2_content"
    t.string   "compendium_top_content_block3_image_file_name"
    t.string   "compendium_top_content_block3_image_content_type"
    t.integer  "compendium_top_content_block3_image_file_size"
    t.datetime "compendium_top_content_block3_image_updated_at"
    t.text     "compendium_top_content_block3_content"
    t.string   "compendium_top_content_block4_image_file_name"
    t.string   "compendium_top_content_block4_image_content_type"
    t.integer  "compendium_top_content_block4_image_file_size"
    t.datetime "compendium_top_content_block4_image_updated_at"
    t.text     "compendium_top_content_block4_content"
    t.string   "compendium_main_content_title"
    t.text     "compendium_main_content"
    t.text     "compendium_main_content_registration"
    t.text     "compendium_main_content_responsibles_title"
    t.string   "compendium_main_content_responsible1_image_file_name"
    t.string   "compendium_main_content_responsible1_image_content_type"
    t.integer  "compendium_main_content_responsible1_image_file_size"
    t.datetime "compendium_main_content_responsible1_image_updated_at"
    t.text     "compendium_main_content_responsible1_content"
    t.string   "compendium_main_content_responsible2_image_file_name"
    t.string   "compendium_main_content_responsible2_image_content_type"
    t.integer  "compendium_main_content_responsible2_image_file_size"
    t.datetime "compendium_main_content_responsible2_image_updated_at"
    t.text     "compendium_main_content_responsible2_content"
    t.string   "compendium_main_content_partners_title"
    t.text     "compendium_main_content_partners_images"
    t.string   "focus_on_woman_title"
    t.string   "focus_on_woman_image_file_name"
    t.string   "focus_on_woman_image_content_type"
    t.integer  "focus_on_woman_image_file_size"
    t.datetime "focus_on_woman_image_updated_at"
    t.text     "focus_on_woman_image_description"
    t.text     "focus_on_woman_quotation"
    t.text     "focus_on_woman_main_content"
    t.string   "fr_title_activity_section"
    t.string   "en_title_activity_section"
    t.string   "title_activity_section"
    t.string   "gallery_title"
    t.text     "compendium_top_content_moral"
    t.text     "compendium_responsible1_bio"
    t.text     "compendium_responsible1_content"
    t.text     "compendium_responsible2_bio"
    t.text     "compendium_responsible2_content"
    t.text     "compendium_responsible1_title"
    t.text     "compendium_responsible2_title"
    t.text     "home_main_bottom"
    t.string   "home_popup_title"
    t.string   "home_popup_image_file_name"
    t.string   "home_popup_image_content_type"
    t.integer  "home_popup_image_file_size"
    t.datetime "home_popup_image_updated_at"
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
    t.string   "home_slider_slide1_text1"
    t.string   "home_slider_slide1_text2"
    t.string   "home_slider_slide1_text3"
    t.string   "home_slider_slide2_text1"
    t.string   "home_slider_slide2_text2"
    t.string   "home_slider_slide2_text3"
    t.string   "home_slider_slide2_text4"
    t.string   "home_slider_slide2_text5"
    t.string   "home_slider_slide2_text6"
    t.string   "home_slider_slide3_text1"
    t.string   "home_slider_slide3_text2"
    t.string   "home_slider_slide3_text3"
    t.string   "home_slider_slide3_text4"
    t.string   "home_slider_slide4_text1"
    t.string   "home_slider_slide4_text2"
    t.string   "home_slider_slide4_text3"
    t.string   "home_slider_slide4_text4"
    t.string   "home_slider_slide4_text5"
    t.string   "home_top_content_title"
    t.text     "home_top_content_quotation"
    t.string   "home_main_content_welcome_word_title"
    t.text     "home_main_content_welcome_word_content"
    t.string   "home_main_content_block1_title"
    t.string   "home_main_content_block1_image_file_name"
    t.string   "home_main_content_block1_image_content_type"
    t.integer  "home_main_content_block1_image_file_size"
    t.datetime "home_main_content_block1_image_updated_at"
    t.text     "home_main_content_block1_content"
    t.string   "home_main_content_block2_title"
    t.string   "home_main_content_block2_image_file_name"
    t.string   "home_main_content_block2_image_content_type"
    t.integer  "home_main_content_block2_image_file_size"
    t.datetime "home_main_content_block2_image_updated_at"
    t.text     "home_main_content_block2_content"
    t.string   "home_main_content_block3_title"
    t.string   "home_main_content_block3_image_file_name"
    t.string   "home_main_content_block3_image_content_type"
    t.integer  "home_main_content_block3_image_file_size"
    t.datetime "home_main_content_block3_image_updated_at"
    t.text     "home_main_content_block3_content"
    t.string   "home_main_content_read_more"
    t.text     "home_footer_block1"
    t.text     "home_footer_block2"
    t.text     "home_footer_block3"
    t.text     "home_footer_block4"
    t.text     "home_footer_copyright"
    t.string   "contact_main_content_title"
    t.text     "contact_main_content_intro_text"
    t.text     "contact_main_content_detailed_contacts"
    t.string   "contact_main_content_form_field_name"
    t.string   "contact_main_content_form_field_email"
    t.string   "contact_main_content_form_field_subject"
    t.text     "contact_main_content_form_field_message"
    t.string   "contact_main_content_form_field_validation_button"
    t.string   "compendium_top_content_title"
    t.string   "compendium_top_content_block1_image_file_name"
    t.string   "compendium_top_content_block1_image_content_type"
    t.integer  "compendium_top_content_block1_image_file_size"
    t.datetime "compendium_top_content_block1_image_updated_at"
    t.text     "compendium_top_content_block1_content"
    t.string   "compendium_top_content_block2_image_file_name"
    t.string   "compendium_top_content_block2_image_content_type"
    t.integer  "compendium_top_content_block2_image_file_size"
    t.datetime "compendium_top_content_block2_image_updated_at"
    t.text     "compendium_top_content_block2_content"
    t.string   "compendium_top_content_block3_image_file_name"
    t.string   "compendium_top_content_block3_image_content_type"
    t.integer  "compendium_top_content_block3_image_file_size"
    t.datetime "compendium_top_content_block3_image_updated_at"
    t.text     "compendium_top_content_block3_content"
    t.string   "compendium_top_content_block4_image_file_name"
    t.string   "compendium_top_content_block4_image_content_type"
    t.integer  "compendium_top_content_block4_image_file_size"
    t.datetime "compendium_top_content_block4_image_updated_at"
    t.text     "compendium_top_content_block4_content"
    t.string   "compendium_main_content_title"
    t.text     "compendium_main_content"
    t.text     "compendium_main_content_registration"
    t.text     "compendium_main_content_responsibles_title"
    t.string   "compendium_main_content_responsible1_image_file_name"
    t.string   "compendium_main_content_responsible1_image_content_type"
    t.integer  "compendium_main_content_responsible1_image_file_size"
    t.datetime "compendium_main_content_responsible1_image_updated_at"
    t.text     "compendium_main_content_responsible1_content"
    t.string   "compendium_main_content_responsible2_image_file_name"
    t.string   "compendium_main_content_responsible2_image_content_type"
    t.integer  "compendium_main_content_responsible2_image_file_size"
    t.datetime "compendium_main_content_responsible2_image_updated_at"
    t.text     "compendium_main_content_responsible2_content"
    t.string   "compendium_main_content_partners_title"
    t.text     "compendium_main_content_partners_images"
    t.string   "focus_on_woman_title"
    t.string   "focus_on_woman_image_file_name"
    t.string   "focus_on_woman_image_content_type"
    t.integer  "focus_on_woman_image_file_size"
    t.datetime "focus_on_woman_image_updated_at"
    t.text     "focus_on_woman_image_description"
    t.text     "focus_on_woman_quotation"
    t.text     "focus_on_woman_main_content"
    t.string   "fr_title_activity_section"
    t.string   "en_title_activity_section"
    t.string   "title_activity_section"
    t.string   "gallery_title"
    t.text     "compendium_top_content_moral"
    t.text     "compendium_responsible1_bio"
    t.text     "compendium_responsible1_content"
    t.text     "compendium_responsible2_bio"
    t.text     "compendium_responsible2_content"
    t.text     "compendium_responsible1_title"
    t.text     "compendium_responsible2_title"
    t.text     "home_main_bottom"
    t.string   "home_popup_title"
    t.string   "home_popup_image_file_name"
    t.string   "home_popup_image_content_type"
    t.integer  "home_popup_image_file_size"
    t.datetime "home_popup_image_updated_at"
  end

  create_table "gallery_attachments", force: true do |t|
    t.integer  "gallery_category_id"
    t.string   "photo_attachment_file_name"
    t.string   "photo_attachment_content_type"
    t.integer  "photo_attachment_file_size"
    t.datetime "photo_attachment_updated_at"
    t.string   "pdf_attachment_file_name"
    t.string   "pdf_attachment_content_type"
    t.integer  "pdf_attachment_file_size"
    t.datetime "pdf_attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.text     "fr_description"
    t.text     "en_description"
  end

  create_table "gallery_categories", force: true do |t|
    t.string   "fr_title"
    t.string   "en_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "publication_date"
    t.boolean  "published"
    t.text     "fr_description"
    t.text     "en_description"
  end

  create_table "juridical_statuses", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "number_of_employees", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "activity_field_id"
    t.text     "description"
    t.integer  "studies_level_id"
    t.integer  "min_years_of_experience"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_years_of_experience"
    t.text     "profile"
    t.integer  "contract_type_id"
    t.integer  "country_id"
    t.string   "city"
    t.integer  "position_available"
    t.string   "title"
    t.date     "expiration_date"
    t.boolean  "validated"
    t.integer  "validated_by"
    t.datetime "validated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortcut",   limit: 20
  end

  create_table "social_statuses", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studies_levels", force: true do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscription_formulas", force: true do |t|
    t.integer  "duration"
    t.integer  "amount"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "subscription_formula_id"
    t.integer  "user_id"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "renewed_by"
    t.datetime "renewed_at"
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

  create_table "visits", id: :uuid, force: true do |t|
    t.uuid     "visitor_id"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

end
