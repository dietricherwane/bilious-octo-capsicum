class AddActivitySectionsToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :title_activity_section, :string
  end
end
