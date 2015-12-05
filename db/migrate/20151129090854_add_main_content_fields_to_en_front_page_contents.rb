class AddMainContentFieldsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :home_main_content_welcome_word_title, :string
    add_column :en_front_page_contents, :home_main_content_welcome_word_content, :text
    add_column :en_front_page_contents, :home_main_content_block1_title, :string
    add_attachment :en_front_page_contents, :home_main_content_block1_image
    add_column :en_front_page_contents, :home_main_content_block1_content, :text
    add_column :en_front_page_contents, :home_main_content_block2_title, :string
    add_attachment :en_front_page_contents, :home_main_content_block2_image
    add_column :en_front_page_contents, :home_main_content_block2_content, :text
    add_column :en_front_page_contents, :home_main_content_block3_title, :string
    add_attachment :en_front_page_contents, :home_main_content_block3_image
    add_column :en_front_page_contents, :home_main_content_block3_content, :text
  end
end
