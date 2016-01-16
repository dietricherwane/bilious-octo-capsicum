class CreateJuridicalStatuses < ActiveRecord::Migration
  def change
    create_table :juridical_statuses do |t|
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
