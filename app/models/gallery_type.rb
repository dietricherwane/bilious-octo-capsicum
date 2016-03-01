class GalleryType < ActiveRecord::Base
  # Relationships
  has_many :gallery_categories

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Titre"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
