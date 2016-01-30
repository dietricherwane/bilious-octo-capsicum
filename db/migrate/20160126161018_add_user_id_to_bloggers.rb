class AddUserIdToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :user_id, :integer
  end
end
