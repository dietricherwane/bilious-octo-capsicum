class AddPublishedToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :published, :boolean
  end
end
