class AddCompendiumFieldsToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :compendium_top_content_title, :string
    add_attachment :fr_front_page_contents, :compendium_top_content_block1_image
    add_column :fr_front_page_contents, :compendium_top_content_block1_content, :text
    add_attachment :fr_front_page_contents, :compendium_top_content_block2_image
    add_column :fr_front_page_contents, :compendium_top_content_block2_content, :text
    add_attachment :fr_front_page_contents, :compendium_top_content_block3_image
    add_column :fr_front_page_contents, :compendium_top_content_block3_content, :text
    add_attachment :fr_front_page_contents, :compendium_top_content_block4_image
    add_column :fr_front_page_contents, :compendium_top_content_block4_content, :text
    add_column :fr_front_page_contents, :compendium_main_content_title, :string
    add_column :fr_front_page_contents, :compendium_main_content, :text
    add_column :fr_front_page_contents, :compendium_main_content_registration, :text
    add_column :fr_front_page_contents, :compendium_main_content_responsibles_title, :text
    add_attachment :fr_front_page_contents, :compendium_main_content_responsible1_image
    add_column :fr_front_page_contents, :compendium_main_content_responsible1_content, :text
    add_attachment :fr_front_page_contents, :compendium_main_content_responsible2_image
    add_column :fr_front_page_contents, :compendium_main_content_responsible2_content, :text
    add_column :fr_front_page_contents, :compendium_main_content_partners_title, :string
    add_column :fr_front_page_contents, :compendium_main_content_partners_images, :text
  end
end
