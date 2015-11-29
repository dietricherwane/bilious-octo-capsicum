class ManageFrontFrContentController < ApplicationController

  def update_home_page_content
    @fr_content = FrFrontPageContent.first
    @fr_content.update_attributes!(params.require(:fr_front_page_content).permit(:home_toolbar_phone_number, :home_toolbar_email, :home_toolbar_language_fr, :home_toolbar_language_en, :home_toolbar_registration, :home_toolbar_my_account, :home_main_menu_home, :home_main_menu_compendium, :home_main_menu_blog, :home_main_menu_gallery, :home_main_menu_contact, :home_slider_slide1_text1, :home_slider_slide1_text2, :home_slider_slide1_text3, :home_slider_slide2_text1, :home_slider_slide2_text2, :home_slider_slide2_text3, :home_slider_slide2_text4, :home_slider_slide2_text5, :home_slider_slide2_text6, :home_slider_slide3_text1, :home_slider_slide3_text2, :home_slider_slide3_text3, :home_slider_slide3_text4, :home_slider_slide4_text1, :home_slider_slide4_text2, :home_slider_slide4_text3, :home_slider_slide4_text4, :home_slider_slide4_text5))
    flash[:success] = "Le contenu français de la page d'accueil a été mis à jour."

    redirect_to :back
  end

end
