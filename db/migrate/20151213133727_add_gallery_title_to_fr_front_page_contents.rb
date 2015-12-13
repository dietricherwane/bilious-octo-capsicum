class AddGalleryTitleToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :gallery_title, :string
  end
end
