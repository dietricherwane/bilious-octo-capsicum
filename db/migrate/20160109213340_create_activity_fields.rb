class CreateActivityFields < ActiveRecord::Migration
  def change
    create_table :activity_fields do |t|
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
