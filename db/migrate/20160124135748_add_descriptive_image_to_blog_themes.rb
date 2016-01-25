class AddDescriptiveImageToBlogThemes < ActiveRecord::Migration
  def change
    add_attachment :blog_themes, :descriptive_image
  end
end
