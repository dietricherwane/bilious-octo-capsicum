class AddGalleryTypeIdToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :gallery_type_id, :integer
  end
end
