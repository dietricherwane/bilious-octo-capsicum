class FrFrontPageContent < ActiveRecord::Base
  has_attached_file :home_logo1, styles: {logo: "209x90#"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_logo2, styles: {logo: "235x105#"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_popup_image, styles: {front: "800x600#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_main_content_block1_image, styles: {front: "340x190#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_main_content_block2_image, styles: {front: "340x190#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :home_main_content_block3_image, styles: {front: "340x190#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :compendium_top_content_block1_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :compendium_top_content_block2_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :compendium_top_content_block3_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :compendium_top_content_block4_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :compendium_main_content_responsible1_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :compendium_main_content_responsible2_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  has_attached_file :focus_on_woman_image, styles: {front: "340x340#", article: "270x270#", thumb: "100x100#", tiny: "80x80#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :home_logo1, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_logo2, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_popup_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_main_content_block1_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_main_content_block2_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :home_main_content_block3_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :compendium_top_content_block1_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :compendium_top_content_block2_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :compendium_top_content_block3_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :compendium_top_content_block4_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :compendium_main_content_responsible1_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :compendium_main_content_responsible2_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :focus_on_woman_image, content_type: /\Aimage\/.*\Z/

  # Rename attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :home_logo1 => "Logo 1",
    :home_logo2 => "Logo 2",
    :home_popup_title => "Titre du popup d'accueil",
    :home_popup_image => "Image du popup d'accueil",
    :home_toolbar_phone_number => "Job",
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
    :home_main_bottom => "Bas de page",
    :home_footer_block1 => "Bloc 1 du pied de page",
    :home_footer_block2 => "Bloc 2 du pied de page",
    :home_footer_block3 => "Bloc 3 du pied de page",
    :home_footer_block4 => "Bloc 3 du pied de page",
    :home_footer_copyright => "Copyright",
    :title_activity_section => "Titre de la section activités",
    :contact_main_content_title => "Titre de la page",
    :contact_main_content_intro_text => "Texte introductif",
    :contact_main_content_detailed_contacts => "Fiche de contacts",
    :contact_main_content_form_field_name => "Champ nom du formulaire",
    :contact_main_content_form_field_email => "Champ email du formulaire",
    :contact_main_content_form_field_subject => "Champ sujet du formulaire",
    :contact_main_content_form_field_message => "Champ message du formulaire",
    :contact_main_content_form_field_validation_button => "Intitulé du bouton de validation",
    :compendium_top_content_moral => "Titre de la section valeurs",
    :compendium_top_content_title => "Titre de la page",
    :compendium_top_content_block1_image => "Image du bloc 1",
    :compendium_top_content_block1_content => "Contenu du bloc 1",
    :compendium_top_content_block2_image => "Image du bloc 2",
    :compendium_top_content_block2_content => "Contenu du bloc 2",
    :compendium_top_content_block3_image => "Image du bloc 3",
    :compendium_top_content_block3_content => "Contenu du bloc 3",
    :compendium_top_content_block4_image => "Image du bloc 4",
    :compendium_top_content_block4_content => "Contenu du bloc 4",
    :compendium_main_content_title => "Titre du corps de la page",
    :compendium_main_content => "Corps de la page",
    :compendium_main_content_registration => "Notice d'enregistrement",
    :compendium_main_content_responsibles_title => "Titre de la section responsables",
    :compendium_main_content_responsible1_image => "Image du responsable 1",
    :compendium_main_content_responsible1_content => "Biographie du responsable 1",
    :compendium_main_content_responsible2_image => "Image du responsable 2",
    :compendium_main_content_responsible2_content => "Biographie du responsable 2",
    :compendium_responsible1_title  => "Titre de la biographie du responsable 1",
    :compendium_responsible2_title  => "Titre de la biographie du responsable 2",
    :compendium_responsible1_bio  => "Détail-Biographie du responsable 1",
    :compendium_responsible2_bio  => "Détail-Biographie du responsable 2",
    :compendium_responsible1_content  => "Détail-Description du responsable 1",
    :compendium_responsible2_content  => "Détail-Description du responsable 2",
    :compendium_main_content_partners_title => "Titre de la section partenaires",
    :compendium_main_content_partners_images => "Partenaires",
    :focus_on_woman_title => "Titre de la page",
    :focus_on_woman_image => "Image introductive",
    :focus_on_woman_image_description => "Description de l'image",
    :focus_on_woman_quotation => "Citation",
    :focus_on_woman_main_content => "Corps de la page",
    :gallery_title => "Titre de la galerie"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
end
