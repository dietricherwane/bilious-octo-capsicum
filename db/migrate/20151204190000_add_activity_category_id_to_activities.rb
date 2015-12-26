class AddActivityCategoryIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :activity_category_id, :integer
  end
end
