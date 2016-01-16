class Country < ActiveRecord::Base
  # Relationships
  has_many :companies
  has_many :offers

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Intitulé"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: true
end
