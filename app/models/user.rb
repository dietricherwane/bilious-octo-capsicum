class User < ActiveRecord::Base

  # Default scope
  default_scope {order(profile_id: :asc, created_at: :desc)}

  # Relationships
  belongs_to :profile

  # Handle avatar pictures
  has_attached_file :avatar, styles: {small: "18x18", thumb: "37x37", medium: "300x300"}
  validates_attachment :avatar, content_type: {content_type: /\Aimage\/.*\Z/}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :profile_id => "Profil",
    :avatar => "Photo de profil",
    :first_name => "Nom",
    :last_name => "Prénoms",
    :phone_number => "Numéro fixe",
    :mobile_number => "Numéro mobile",
    :identity_card_id => "Numéro de pièce d'identité",
    :address => "Adresse géographique",
    :email => "Adresse email",
    :password => "Mot de passe",
    :created_by => "Créé par",
    :created_at => "Créé le",
    :published_by => "Réactivé par",
    :published_at => "Réactivé le",
    :unpublished_by => "Désactivé par",
    :unpublished_at => "Désactivé le",
    :current_password => "Mot de passe actuel",
    :password_confirmation => "Confirmation du mot de passe"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validators
  validates :first_name, :last_name, :profile_id, :mobile_number, :identity_card_id, :address, presence: true
  validates :first_name, :last_name, length: {minimum: 2, allow_blank: true}
  validates :address, length: {minimum: 5, allow_blank: true}
  validates :phone_number, :mobile_number, numericality: {message: "n'est pas numérique", allow_blank: true}
  validates :phone_number, :mobile_number, length: {minimum: 8, maximum: 13, allow_blank: true}

   # Custom functions
   def full_name
    return "#{last_name} #{first_name} [#{profile.name}]"
   end

   def phone_numbers
    return "#{mobile_number} - #{phone_number}"
   end
end
