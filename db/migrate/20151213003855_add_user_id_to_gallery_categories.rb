class AddUserIdToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :user_id, :integer
  end
end
