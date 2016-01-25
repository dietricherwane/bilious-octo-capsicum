class AddRenewedByToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :renewed_by, :integer
    add_column :subscriptions, :renewed_at, :datetime
  end
end
