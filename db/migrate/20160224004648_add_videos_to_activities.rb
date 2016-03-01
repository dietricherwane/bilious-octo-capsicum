class AddVideosToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :videos, :text
  end
end
