class AddEmailToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :email, :string
  end
end
