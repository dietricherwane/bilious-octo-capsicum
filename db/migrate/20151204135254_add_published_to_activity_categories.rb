class AddPublishedToActivityCategories < ActiveRecord::Migration
  def change
    add_column :activity_categories, :published, :boolean
  end
end
