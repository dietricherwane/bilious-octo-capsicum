class CreateActivityCategories < ActiveRecord::Migration
  def change
    create_table :activity_categories do |t|
      t.string :fr_title
      t.string :en_title
      t.integer :user_id

      t.timestamps
    end
  end
end
