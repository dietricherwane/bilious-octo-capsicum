class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.integer :blog_theme_id
      t.text :content
      t.string :firstname
      t.string :lastname
      t.boolean :published

      t.timestamps
    end
  end
end
