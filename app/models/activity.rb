class Activity < ActiveRecord::Base
  # Relationships
  belongs_to :user
  belongs_to :activity_category
  has_many :activity_attachments

  # Validations
  validates :fr_title, :user_id, presence: true

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :fr_title => "Titre français",
    :en_title => "Titre anglais",
    :fr_content => "Contenu français",
    :en_content => "Contenu anglais",
    :description_image => "Image illustrative",
    :user_id => "L'auteur de l'article",
    :activity_category_id => "Catégorie d'activité",
    :publication_date => "Date de publication"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end


  # Custom functions
  def attachments_array=(array)
   array.each do |file|
    activity_attachments.build(:activity_attachment => file)
   end
  end
end
