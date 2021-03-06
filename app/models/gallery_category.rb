class GalleryCategory < ActiveRecord::Base
  # Relationships
  belongs_to :user
  belongs_to :gallery_type
  has_many :gallery_attachments

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :fr_title => "Titre français",
    :fr_description => "Description française",
    :en_title => "Titre anglais",
    :en_description => "Description Anglaise",
    :user_id => "L'auteur de l'article",
    :publication_date => "Date de publication",
    :video_links => "Vidéos",
    :gallery_type_id => "Type de galerie"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :fr_title, :user_id, :gallery_type_id, presence: true
  validates :fr_title, :en_title, uniqueness: true

  # Custom functions
  def photos_attachments_array=(array)
    array.each do |file|
      gallery_items.build(:photo_attachment => file)
    end
  end

  def pdf_attachments_array=(array)
    array.each do |file|
      gallery_items.build(:pdf_attachment => file)
    end
  end
end
