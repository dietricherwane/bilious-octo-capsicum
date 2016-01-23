class AddDescriptionToGalleryAttachments < ActiveRecord::Migration
  def change
    add_column :gallery_attachments, :description, :text
  end
end
