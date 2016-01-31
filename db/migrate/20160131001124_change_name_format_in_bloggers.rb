class ChangeNameFormatInBloggers < ActiveRecord::Migration
  def change
    change_column :bloggers, :name, :text
  end
end
