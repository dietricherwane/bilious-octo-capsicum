class AddDescriptionTextToBloggers < ActiveRecord::Migration
  def change
    add_column :bloggers, :description_text, :text
  end
end
