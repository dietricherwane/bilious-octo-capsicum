class ActivityCategory < ActiveRecord::Base
  # Relationships
  belongs_to :user
  has_many :activities

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :fr_title => "Titre français",
    :en_title => "Titre anglais",
    :user_id => "L'auteur de l'article",
    :publication_date => "Date de publication"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :fr_title, :user_id, presence: true
end
