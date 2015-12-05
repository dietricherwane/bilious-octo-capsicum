class AddActivityIdToActivityAttachments < ActiveRecord::Migration
  def change
    add_column :activity_attachments, :activity_id, :integer
  end
end
