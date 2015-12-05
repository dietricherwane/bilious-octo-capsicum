class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :fr_title
      t.text :en_title
      t.text :fr_content
      t.text :en_content
      t.datetime :published_at
      t.attachment :description_image
      t.integer :user_id

      t.timestamps
    end
  end
end
