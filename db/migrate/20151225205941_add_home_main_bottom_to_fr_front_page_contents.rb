class AddHomeMainBottomToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :home_main_bottom, :text
  end
end
