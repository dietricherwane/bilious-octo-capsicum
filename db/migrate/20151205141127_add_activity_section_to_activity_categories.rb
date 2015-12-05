class AddActivitySectionToActivityCategories < ActiveRecord::Migration
  def change
    add_column :activity_categories, :fr_title_activity_section, :string
    add_column :activity_categories, :en_title_activity_section, :string
  end
end
