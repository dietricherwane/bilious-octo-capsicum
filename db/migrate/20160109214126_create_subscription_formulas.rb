class CreateSubscriptionFormulas < ActiveRecord::Migration
  def change
    create_table :subscription_formulas do |t|
      t.integer :duration
      t.integer :amount
      t.boolean :published

      t.timestamps
    end
  end
end
