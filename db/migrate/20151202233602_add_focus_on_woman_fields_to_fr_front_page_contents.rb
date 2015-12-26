class AddFocusOnWomanFieldsToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :focus_on_woman_title, :string
    add_attachment :fr_front_page_contents, :focus_on_woman_image
    add_column :fr_front_page_contents, :focus_on_woman_image_description, :text
    add_column :fr_front_page_contents, :focus_on_woman_quotation, :text
    add_column :fr_front_page_contents, :focus_on_woman_main_content, :text
  end
end
