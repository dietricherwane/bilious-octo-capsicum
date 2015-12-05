class AddPublishedToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :published, :boolean
  end
end
