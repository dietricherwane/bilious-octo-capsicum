class AddProfileIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :profile_id, :integer
  end
end
