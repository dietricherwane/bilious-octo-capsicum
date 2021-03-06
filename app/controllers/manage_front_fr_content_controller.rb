class ManageFrontFrContentController < ApplicationController
  before_filter :authenticate_user!

  def update_home_page_content
    @fr_content = FrFrontPageContent.first
    captchi = params[:"g-recaptcha-response"]

    if captchi.blank? || captchi.length < 200
      flash[:error] = "Le captcha n'est pas valide"
    else
      @fr_content.update_attributes!(params.require(:fr_front_page_content).permit(:home_toolbar_phone_number, :home_toolbar_email, :home_toolbar_language_fr, :home_toolbar_language_en, :home_toolbar_registration, :home_toolbar_my_account, :home_main_menu_home, :home_main_menu_compendium, :home_main_menu_blog, :home_main_menu_gallery, :home_main_menu_contact, :home_slider_slide1_text1, :home_slider_slide1_text2, :home_slider_slide1_text3, :home_slider_slide2_text1, :home_slider_slide2_text2, :home_slider_slide2_text3, :home_slider_slide2_text4, :home_slider_slide2_text5, :home_slider_slide2_text6, :home_slider_slide3_text1, :home_slider_slide3_text2, :home_slider_slide3_text3, :home_slider_slide3_text4, :home_slider_slide4_text1, :home_slider_slide4_text2, :home_slider_slide4_text3, :home_slider_slide4_text4, :home_slider_slide4_text5, :home_top_content_title, :home_top_content_quotation, :home_main_content_welcome_word_title, :home_main_content_welcome_word_content, :home_main_content_block1_title, :home_main_content_block1_image, :home_main_content_block1_content, :home_main_content_block2_title, :home_main_content_block2_image, :home_main_content_block2_content, :home_main_content_block3_title, :home_main_content_block3_image, :home_main_content_block3_content, :home_main_content_read_more, :home_footer_block1, :home_footer_block2, :home_footer_block3, :home_footer_block4, :home_footer_copyright, :contact_main_content_title, :contact_main_content_intro_text, :contact_main_content_detailed_contacts, :contact_main_content_form_field_name, :contact_main_content_form_field_email, :contact_main_content_form_field_subject, :contact_main_content_form_field_message, :contact_main_content_form_field_validation_button, :compendium_top_content_title, :compendium_top_content_block1_image, :compendium_top_content_block1_content, :compendium_top_content_block2_image, :compendium_top_content_block2_content, :compendium_top_content_block3_image, :compendium_top_content_block3_content, :compendium_top_content_block4_image, :compendium_top_content_block4_content, :compendium_main_content_title, :compendium_main_content, :compendium_main_content_registration, :compendium_main_content_responsibles_title, :compendium_main_content_responsible1_image, :compendium_main_content_responsible1_content, :compendium_main_content_responsible2_image, :compendium_main_content_responsible2_content, :compendium_main_content_partners_title, :compendium_main_content_partners_images, :focus_on_woman_title, :focus_on_woman_image, :focus_on_woman_image_description, :focus_on_woman_quotation, :focus_on_woman_main_content, :focus_on_woman_image_file_name, :title_activity_section, :gallery_title, :compendium_top_content_moral, :compendium_responsible1_title, :compendium_responsible2_title, :compendium_responsible1_bio, :compendium_responsible2_bio, :compendium_responsible1_content, :compendium_responsible2_content, :home_main_bottom, :home_popup_title, :home_popup_image, :home_logo1, :home_logo2, :home_popup_video))
      flash[:success] = "Le contenu français de la page d'accueil a été mis à jour."
    end

    redirect_to :back
  end

end
