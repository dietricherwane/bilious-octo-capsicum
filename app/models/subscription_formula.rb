class SubscriptionFormula < ActiveRecord::Base
  # Relationships
  has_many :subscriptions

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :duration => "Durée",
    :amount => "Montant"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: true
end
