class Offer < ActiveRecord::Base
  # Relationships
  belongs_to :company
  belongs_to :user
  belongs_to :activity_field
  belongs_to :studies_level
  belongs_to :contract_type
  belongs_to :country

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :company_name => "Nom de l'entreprise",
    :company_id => "Entreprise",
    :user_id => "Utilisateur",
    :activity_field_id => "Domaine d'activités",
    :title => "Intitulé du poste",
    :studies_level_id => "Niveau d'études",
    :min_years_of_experience => "Minimum d'années d'expérience",
    :max_years_of_experience => "Maximum d'années d'expérience",
    :profile => "Profil du candidat",
    :contract_type_id => "Type de contrat",
    :country_id => "Pays",
    :city => "Ville",
    :position_available => "Nombre de places disponibles",
    :expiration_date => "Date d'expiration"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :activity_field_id, :title, :studies_level_id, :min_years_of_experience, :max_years_of_experience, :profile, :contract_type_id, :country_id, :city, :position_available, :description, :expiration_date, presence: true
  validates :min_years_of_experience, :max_years_of_experience, :position_available, numericality: true
  validate :filter_min_max_experience_years
  #validate :filter_expiration_date

  def filter_min_max_experience_years
    if ((min_years_of_experience < 0) rescue true) || ((min_years_of_experience > max_years_of_experience) rescue true)
      errors.add(:min_years_of_experience, "n'est pas valide")
    end

    if (max_years_of_experience < 0 rescue true)
      errors.add(:max_years_of_experience, "ne peut pas être négatif")
    end
  end

  def filter_number_of_positions
    if (position_available < 1  rescue true)
      errors.add(:position_available, "n'est pas valide")
    end
  end

  def filter_expiration_date
    if (expiration_date < Date.today rescue true && validated.blank?)
      errors.add(:expiration_date, "n'est pas valide")
    end
  end
end
