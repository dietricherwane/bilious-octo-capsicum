class CreateBoundaryDetails < ActiveRecord::Migration
  def change
    create_table :boundary_details do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
