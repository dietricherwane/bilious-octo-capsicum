class CreateBloggers < ActiveRecord::Migration
  def change
    create_table :bloggers do |t|
      t.string :title
      t.string :name
      t.attachment :description_image
      t.text :content

      t.timestamps
    end
  end
end
