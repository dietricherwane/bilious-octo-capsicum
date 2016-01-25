class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.string :title
      t.boolean :published
      t.integer :created_by

      t.timestamps
    end
  end
end
