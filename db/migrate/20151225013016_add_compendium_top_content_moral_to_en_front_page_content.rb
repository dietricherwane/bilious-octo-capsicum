class AddCompendiumTopContentMoralToEnFrontPageContent < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :compendium_top_content_moral, :text
  end
end
