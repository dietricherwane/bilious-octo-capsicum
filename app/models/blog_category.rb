class BlogCategory < ActiveRecord::Base
  # Relationships
  has_many :blog_themes

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :title => "Titre",
    :created_by => "Auteur"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :title, :created_by, presence: true
  validates :title, uniqueness: true
end
