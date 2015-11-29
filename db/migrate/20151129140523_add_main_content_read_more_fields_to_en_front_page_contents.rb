class AddMainContentReadMoreFieldsToEnFrontPageContents < ActiveRecord::Migration
  def change
    add_column :en_front_page_contents, :home_main_content_read_more, :string
  end
end
