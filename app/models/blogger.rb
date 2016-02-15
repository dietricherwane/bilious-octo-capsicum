class Blogger < ActiveRecord::Base
  # Relationships
  belongs_to :user
  has_many :blog_themes

  has_attached_file :description_image, styles: {front: "270x210#", thumb: "425x200#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :description_image, content_type: /\Aimage\/.*\Z/

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :user_id => "Auteur",
    :title => "Titre",
    :name => "Nom du bloggeur",
    :description_text => "Texte descriptif",
    :content => "Contenu",
    :description_image => "Image descriptive"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :user_id, :title, :content, :name, presence: true
end
