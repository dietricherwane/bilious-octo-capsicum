class ContactForm < ActiveRecord::Base
  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Nom",
    :email => "Email",
    :subject => "Sujet",
    :content => "Contenu"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, :email, :subject, :content, presence: true
  validates :email, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true, allow_blank: true}
  validates :name, :email, :subject, length: {maximum: 250}
end
