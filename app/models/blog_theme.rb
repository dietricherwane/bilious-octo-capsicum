class BlogTheme < ActiveRecord::Base
  # Relationships
  belongs_to :blog_category
  has_many :blog_posts
  belongs_to :blogger

  has_attached_file :descriptive_image, styles: {front: "850x400#", article: "800x600#", thumb: "425x200#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :descriptive_image, content_type: /\Aimage\/.*\Z/

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :blogger_id => "Bloggeur",
    :blog_category_id => "Catégorie de blog",
    :title => "Titre",
    :content => "Contenu",
    :created_by => "Auteur",
    :descriptive_image => "Image descriptive",
    :descriptive_video => "Vidéo descriptive"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :blog_category_id, :title, :content, :created_by, :blogger_id, presence: true
  validates :title, uniqueness: { scope: :blogger_id,
    message: "doit être unique par bloggeur." }
end
