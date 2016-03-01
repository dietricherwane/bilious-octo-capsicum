class AddVideoLinksToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :video_links, :text
  end
end
