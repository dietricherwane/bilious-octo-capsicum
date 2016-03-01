class BlogPost < ActiveRecord::Base
  # Relationships
  belongs_to :blog_theme

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :blog_theme_id => "Thème de blog",
    :content => "Contenu",
    :firstname => "Nom",
    :lastname => "Prénom",
    :email => "email"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :blog_theme_id, :content, :firstname, :lastname, presence: true
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true}
end
