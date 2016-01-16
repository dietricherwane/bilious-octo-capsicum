class CreateNumberOfEmployees < ActiveRecord::Migration
  def change
    create_table :number_of_employees do |t|
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end
end
