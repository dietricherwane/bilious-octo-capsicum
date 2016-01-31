class AddBloggerIdToBlogThemes < ActiveRecord::Migration
  def change
    add_column :blog_themes, :blogger_id, :integer
  end
end
