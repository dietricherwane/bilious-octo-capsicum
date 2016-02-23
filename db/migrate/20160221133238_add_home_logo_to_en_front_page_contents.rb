class AddHomeLogoToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_attachment :en_front_page_contents, :home_logo1
    add_attachment :en_front_page_contents, :home_logo2
  end
end
