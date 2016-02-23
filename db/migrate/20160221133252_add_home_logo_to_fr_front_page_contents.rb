class AddHomeLogoToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_attachment :fr_front_page_contents, :home_logo1
    add_attachment :fr_front_page_contents, :home_logo2
  end
end
