class AddValidationFieldsToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :validated, :boolean
    add_column :offers, :validated_by, :integer
    add_column :offers, :validated_at, :datetime
  end
end
