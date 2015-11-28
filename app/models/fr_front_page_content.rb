class FrFrontPageContent < ActiveRecord::Base
  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :home_toolbar_phone_number => "Numéro de téléphone",
    :home_toolbar_email => "Email",
    :home_toolbar_language_fr => "Langue française",
    :home_toolbar_language_en => "Langue anglaise",
    :home_toolbar_registration => "Inscription",
    :home_toolbar_my_account => "Mon compte",
    :home_main_menu_home => "Accueil",
    :home_main_menu_compendium => "Compendium",
    :home_main_menu_blog => "Blog",
    :home_main_menu_gallery => "Galerie",
    :home_main_menu_contact => "Contacts"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
