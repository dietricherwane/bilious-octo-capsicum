class AddEnFrdescriptionToGalleryAttachments < ActiveRecord::Migration
  def change
    add_column :gallery_attachments, :fr_description, :text
    add_column :gallery_attachments, :en_description, :text
  end
end
