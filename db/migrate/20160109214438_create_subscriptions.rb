class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscription_formula_id
      t.integer :user_id
      t.datetime :begin_date
      t.datetime :end_date
      t.string :transaction_id

      t.timestamps
    end
  end
end
