class CreateBlogThemes < ActiveRecord::Migration
  def change
    create_table :blog_themes do |t|
      t.integer :blog_category_id
      t.string :title
      t.text :content
      t.integer :created_by
      t.boolean :published

      t.timestamps
    end
  end
end
