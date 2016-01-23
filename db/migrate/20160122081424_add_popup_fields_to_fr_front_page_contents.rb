class AddPopupFieldsToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :home_popup_title, :string
    add_attachment :fr_front_page_contents, :home_popup_image
  end
end
