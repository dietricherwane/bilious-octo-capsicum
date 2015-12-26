class CreateGalleryAttachments < ActiveRecord::Migration
  def change
    create_table :gallery_attachments do |t|
      t.integer :gallery_category_id
      t.attachment :photo_attachment
      t.attachment :pdf_attachment

      t.timestamps
    end
  end
end
