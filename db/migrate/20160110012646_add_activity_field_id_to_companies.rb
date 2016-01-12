class AddActivityFieldIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :activity_field_id, :integer
  end
end
