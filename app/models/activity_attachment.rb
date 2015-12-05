class ActivityAttachment < ActiveRecord::Base
  # Relationships
  belongs_to :activity

  has_attached_file :attachment, styles: {front: "400x300", article: "800x600", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
end
