class AddGalleryTitleToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :gallery_title, :string
  end
end
