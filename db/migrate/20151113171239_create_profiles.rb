class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
