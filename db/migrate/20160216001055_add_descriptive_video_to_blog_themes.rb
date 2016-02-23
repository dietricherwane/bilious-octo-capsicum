class AddDescriptiveVideoToBlogThemes < ActiveRecord::Migration
  def change
    add_column :blog_themes, :descriptive_video, :string
  end
end
