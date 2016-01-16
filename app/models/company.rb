class Company < ActiveRecord::Base
  has_attached_file :logo, styles: {thumb: "100x100", medium: "200x200"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  # Relationships
  has_many :subscriptions
  has_many :offers
  belongs_to :activity_field
  belongs_to :juridical_status
  belongs_to :number_of_employee
  belongs_to :country
  belongs_to :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :logo => "Logo",
    :name => "Raison sociale",
    :shortcut => "Sigle",
    :activity_field_id => "Secteur d'activités",
    :juridical_status_id => "Forme juridique",
    :commercial_id => "N° de régistre de commerce",
    :number_of_employee_id => "Nombre d'employés",
    :revenue => "Capital",
    :telephone => "Numéro de téléphone",
    :fax => "Fax",
    :website => "Site web",
    :email => "Email",
    :address => "Adresse",
    :country_id => "Country",
    :city => "Ville",
    :description => "Description des activités",
    :profile_id => "Profil"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :logo, :name, :activity_field_id, :juridical_status_id, :commercial_id, :number_of_employee_id, :revenue, :telephone, :description, :profile_id, presence: true
  validates :address, length: {minimum: 5, allow_blank: true}
  validates :telephone, :fax, :revenue, numericality: {message: "n'est pas numérique", allow_blank: true}
  validates :telephone, :fax, length: {minimum: 8, maximum: 13, allow_blank: true}
end
