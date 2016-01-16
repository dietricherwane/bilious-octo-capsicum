class CreateStudiesLevels < ActiveRecord::Migration
  def change
    create_table :studies_levels do |t|
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
