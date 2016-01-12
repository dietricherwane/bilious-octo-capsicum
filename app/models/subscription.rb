class Subscription < ActiveRecord::Base
  # Relationships
  belongs_to :subscription_formula
  belongs_to :company

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :subscription_formula_id => "Formule de souscription",
    :user_id => "Auteur",
    :company_id => "Entreprise",
    :transaction_id => "Id de transaction",
    :begin_date => "Date de début",
    :end_date => "Date de fin"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :subscription_formula_id, :company_id, :transaction_id, :begin_date, :end_date, presence: true
end
