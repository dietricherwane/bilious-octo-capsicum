class AddHomePopupVideoToEnFrontPageContent < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :home_popup_video, :string
  end
end
