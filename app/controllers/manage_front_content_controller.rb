class ManageFrontContentController < ApplicationController
  before_filter :authenticate_user!
  layout :select_layout

  def home_page
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()

    @website_content_menu_style = "current"
    @home_website_content_menu_style = "this"
  end

  def focus_on_woman_page
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()

    @website_content_menu_style = "current"
    @focus_website_content_menu_style = "this"
  end

  def compendium_page
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()

    @website_content_menu_style = "current"
    @compendium_website_content_menu_style = "this"
  end

  def contact_page
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()

    @website_content_menu_style = "current"
    @contact_website_content_menu_style = "this"
  end
end
