class EnFrontPageContent < ActiveRecord::Base
  has_attached_file :home_main_content_block1_image, styles: {front: "340x340", article: "270x270", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_main_content_block2_image, styles: {front: "340x340", article: "270x270", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_main_content_block3_image, styles: {front: "340x340", article: "270x270", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :home_main_content_block1_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_main_content_block2_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_main_content_block3_image, content_type: /\Aimage\/.*\Z/

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
    :home_slider_slide4_text5 => "Slide 4 Texte 5",
    :home_top_content_title => "Titre de l'en tête",
    :home_top_content_quotation => "Contenu de l'en tête",
    :home_main_content_welcome_word_title => "Intitulé du mot de bienvenue",
    :home_main_content_welcome_word_content => "Contenu du mot de bienvenue",
    :home_main_content_block1_title => "Titre du bloc 1",
    :home_main_content_block2_title => "Titre du bloc 2",
    :home_main_content_block3_title => "Titre du bloc 3",
    :home_main_content_block1_image => "Image du bloc 1",
    :home_main_content_block2_image => "Image du bloc 2",
    :home_main_content_block3_image => "Image du bloc 3",
    :home_main_content_block1_content => "Contenu du bloc 1",
    :home_main_content_block2_content => "Contenu du bloc 2",
    :home_main_content_block3_content => "Contenu du bloc 3",
    :home_main_content_read_more => "Savoir plus",
    :home_footer_block1 => "Bloc 1 du pied de page",
    :home_footer_block2 => "Bloc 2 du pied de page",
    :home_footer_block3 => "Bloc 3 du pied de page",
    :home_footer_block4 => "Bloc 4 du pied de page",
    :home_footer_copyright => "Copyright"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
