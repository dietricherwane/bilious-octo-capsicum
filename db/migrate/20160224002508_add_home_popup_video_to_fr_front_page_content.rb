class AddHomePopupVideoToFrFrontPageContent < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :home_popup_video, :string
  end
end
