class CreateBoundaries < ActiveRecord::Migration
  def change
    create_table :boundaries do |t|
      t.belongs_to :profile, index: true
      t.string :rights

      t.timestamps
    end
  end
end
