class AddFieldsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :max_years_of_experience, :integer
    add_column :offers, :profile, :text
    add_column :offers, :contract_type_id, :integer
    add_column :offers, :country_id, :integer
    add_column :offers, :city, :string
    add_column :offers, :position_available, :integer
  end
end
