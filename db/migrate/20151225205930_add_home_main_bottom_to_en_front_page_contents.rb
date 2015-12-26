class AddHomeMainBottomToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :home_main_bottom, :text
  end
end
