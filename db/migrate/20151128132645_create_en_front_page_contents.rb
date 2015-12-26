class CreateEnFrontPageContents < ActiveRecord::Migration
  def change
    create_table :en_front_page_contents do |t|
      t.string :home_toolbar_phone_number
      t.string :home_toolbar_email
      t.string :home_toolbar_language_fr
      t.string :home_toolbar_language_en
      t.string :home_toolbar_registration
      t.string :home_toolbar_my_account
      t.string :home_main_menu_home
      t.string :home_main_menu_compendium
      t.string :home_main_menu_blog
      t.string :home_main_menu_gallery
      t.string :home_main_menu_contact

      t.timestamps
    end
  end
end
