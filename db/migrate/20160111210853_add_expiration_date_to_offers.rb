class AddExpirationDateToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :expiration_date, :date
  end
end
