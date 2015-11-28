class ManageFrontFrContentController < ApplicationController

  def update_home_page_content
    @fr_content = FrFrontPageContent.first
    @fr_content.update_attributes!(params.require(:fr_front_page_content).permit(:home_toolbar_phone_number, :home_toolbar_email, :home_toolbar_language_fr, :home_toolbar_language_en, :home_toolbar_registration, :home_toolbar_my_account))
    flash[:success] = "Le contenu français de la barre d'outils a été mis à jour."

    redirect_to :back
  end

end
