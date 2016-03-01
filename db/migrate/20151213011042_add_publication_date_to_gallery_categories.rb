class AddPublicationDateToGalleryCategories < ActiveRecord::Migration
  def change
    add_column :gallery_categories, :publication_date, :date
    remove_column :gallery_categories, :publication_time
  end
end
