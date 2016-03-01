class AddPublicationDateToActivityCategories < ActiveRecord::Migration
  def change
    add_column :activity_categories, :publication_date, :date
  end
end
