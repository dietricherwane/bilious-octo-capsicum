class AddDescriptionToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :fr_description, :text
    add_column :gallery_categories, :en_description, :text
  end
end
