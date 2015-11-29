class ManageFrontEnContentController < ApplicationController

  def update_home_page_content
    @en_content = EnFrontPageContent.first
    @en_content.update_attributes!(params.require(:en_front_page_content).permit(:home_toolbar_phone_number, :home_toolbar_email, :home_toolbar_language_fr, :home_toolbar_language_en, :home_toolbar_registration, :home_toolbar_my_account, :home_main_menu_home, :home_main_menu_compendium, :home_main_menu_blog, :home_main_menu_gallery, :home_main_menu_contact, :home_slider_slide1_text1, :home_slider_slide1_text2, :home_slider_slide1_text3, :home_slider_slide2_text1, :home_slider_slide2_text2, :home_slider_slide2_text3, :home_slider_slide2_text4, :home_slider_slide2_text5, :home_slider_slide2_text6, :home_slider_slide3_text1, :home_slider_slide3_text2, :home_slider_slide3_text3, :home_slider_slide3_text4, :home_slider_slide4_text1, :home_slider_slide4_text2, :home_slider_slide4_text3, :home_slider_slide4_text4, :home_slider_slide4_text5, :home_top_content_title, :home_top_content_quotation, :home_main_content_welcome_word_title, :home_main_content_welcome_word_content, :home_main_content_block1_title, :home_main_content_block1_image, :home_main_content_block1_content, :home_main_content_block2_title, :home_main_content_block2_image, :home_main_content_block2_content, :home_main_content_block3_title, :home_main_content_block3_image, :home_main_content_block3_content, :home_main_content_read_more, :home_footer_block1, :home_footer_block2, :home_footer_block3, :home_footer_block4, :home_footer_copyright, :contact_main_content_title, :contact_main_content_intro_text, :contact_main_content_detailed_contacts, :contact_main_content_form_field_name, :contact_main_content_form_field_email, :contact_main_content_form_field_subject, :contact_main_content_form_field_message, :contact_main_content_form_field_validation_button))
    flash[:success] = "Le contenu anglais de la page d'accueil a été mis à jour."

    redirect_to :back
  end

end
