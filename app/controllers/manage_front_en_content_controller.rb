class ManageFrontEnContentController < ApplicationController

  def update_home_page_content
    @en_content = EnFrontPageContent.first
    @en_content.update_attributes!(params.require(:en_front_page_content).permit(:home_toolbar_phone_number, :home_toolbar_email, :home_toolbar_language_fr, :home_toolbar_language_en, :home_toolbar_registration, :home_toolbar_my_account))
    flash[:success] = "Le contenu anglais de la barre d'outils a été mis à jour."

    redirect_to :back
  end

end
