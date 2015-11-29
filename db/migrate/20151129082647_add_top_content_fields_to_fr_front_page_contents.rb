class AddTopContentFieldsToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :home_top_content_title, :string
    add_column :fr_front_page_contents, :home_top_content_quotation, :text
  end
end
