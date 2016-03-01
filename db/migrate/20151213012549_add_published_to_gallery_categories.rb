class AddPublishedToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :published, :boolean
  end
end
