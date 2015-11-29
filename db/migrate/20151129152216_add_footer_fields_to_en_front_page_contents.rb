class AddFooterFieldsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :home_footer_block1, :text
    add_column :en_front_page_contents, :home_footer_block2, :text
    add_column :en_front_page_contents, :home_footer_block3, :text
    add_column :en_front_page_contents, :home_footer_block4, :text
    add_column :en_front_page_contents, :home_footer_copyright, :text
  end
end
