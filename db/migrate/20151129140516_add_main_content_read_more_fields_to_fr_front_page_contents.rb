class AddMainContentReadMoreFieldsToFrFrontPageContents < ActiveRecord::Migration
  def change
    add_column :fr_front_page_contents, :home_main_content_read_more, :string
  end
end
