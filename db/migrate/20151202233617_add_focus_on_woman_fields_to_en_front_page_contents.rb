class AddFocusOnWomanFieldsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :focus_on_woman_title, :string
    add_attachment :en_front_page_contents, :focus_on_woman_image
    add_column :en_front_page_contents, :focus_on_woman_image_description, :text
    add_column :en_front_page_contents, :focus_on_woman_quotation, :text
    add_column :en_front_page_contents, :focus_on_woman_main_content, :text
  end
end
