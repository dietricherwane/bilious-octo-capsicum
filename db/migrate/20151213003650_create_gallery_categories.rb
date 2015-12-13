class CreateGalleryCategories < ActiveRecord::Migration
  def change
    create_table :gallery_categories do |t|
      t.string :fr_title
      t.string :en_title
      t.datetime :publication_time

      t.timestamps
    end
  end
end
