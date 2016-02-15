class GalleryAttachment < ActiveRecord::Base
  # Relationships
  belongs_to :gallery_category

  has_attached_file :photo_attachment, styles: {front: "370x247#", article: "800x600#", thumb: "100x100#"}, default_url: "/images/:style/missing.png"
  has_attached_file :pdf_attachment

  # Validations
  validates_attachment_content_type :photo_attachment, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :pdf_attachment, content_type: ["application/pdf", "application/x-pdf"]
  #validates :photo_attachment, :dimensions => { :width => 800, :height => 600 }
end
