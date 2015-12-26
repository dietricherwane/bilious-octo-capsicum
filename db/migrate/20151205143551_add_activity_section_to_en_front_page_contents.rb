class AddActivitySectionToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :fr_title_activity_section, :string
    add_column :en_front_page_contents, :en_title_activity_section, :string
  end
end
