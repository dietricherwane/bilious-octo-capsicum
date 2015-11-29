class EnFrontPageContent < ActiveRecord::Base
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
    :home_main_menu_contact => "Contacts",
    :home_slider_slide1_text1 => "Slide 1 Texte 1",
    :home_slider_slide1_text2 => "Slide 1 Texte 2",
    :home_slider_slide1_text3 => "Slide 1 Texte 3",
    :home_slider_slide2_text1 => "Slide 2 Texte 1",
    :home_slider_slide2_text2 => "Slide 2 Texte 2",
    :home_slider_slide2_text3 => "Slide 2 Texte 3",
    :home_slider_slide2_text4 => "Slide 2 Texte 4",
    :home_slider_slide2_text5 => "Slide 2 Texte 5",
    :home_slider_slide2_text6 => "Slide 2 Texte 6",
    :home_slider_slide3_text1 => "Slide 3 Texte 1",
    :home_slider_slide3_text2 => "Slide 3 Texte 2",
    :home_slider_slide3_text3 => "Slide 3 Texte 3",
    :home_slider_slide3_text4 => "Slide 3 Texte 4",
    :home_slider_slide4_text1 => "Slide 4 Texte 1",
    :home_slider_slide4_text2 => "Slide 4 Texte 2",
    :home_slider_slide4_text3 => "Slide 4 Texte 3",
    :home_slider_slide4_text4 => "Slide 4 Texte 4",
    :home_slider_slide4_text5 => "Slide 4 Texte 5"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
