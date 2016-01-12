class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :company_id
      t.integer :user_id
      t.integer :activity_field_id
      t.text :description
      t.integer :studies_level_id
      t.integer :min_years_of_experience

      t.timestamps
    end
  end
end
