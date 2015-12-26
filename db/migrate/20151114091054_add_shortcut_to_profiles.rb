class AddShortcutToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :shortcut, :string, limit: 20
  end
end
