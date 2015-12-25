class AddCompendiumResponsible1BioToEnFrontPageContent < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :compendium_responsible1_bio, :text
    add_column :en_front_page_contents, :compendium_responsible1_content, :text
    add_column :en_front_page_contents, :compendium_responsible2_bio, :text
    add_column :en_front_page_contents, :compendium_responsible2_content, :text
    add_column :en_front_page_contents, :compendium_responsible1_title, :text
    add_column :en_front_page_contents, :compendium_responsible2_title, :text
  end
end
