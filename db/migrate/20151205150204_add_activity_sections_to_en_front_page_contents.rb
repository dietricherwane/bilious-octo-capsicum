class AddActivitySectionsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :title_activity_section, :string
  end
end
