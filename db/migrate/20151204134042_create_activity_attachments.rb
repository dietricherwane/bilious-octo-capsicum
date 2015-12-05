class CreateActivityAttachments < ActiveRecord::Migration
  def change
    create_table :activity_attachments do |t|
      t.attachment :attachment

      t.timestamps
    end
  end
end
