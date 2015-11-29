class ManageFrontContentController < ApplicationController
  layout :select_layout

  def home_page
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()

    @website_content_menu_style = "current"
    @home_website_content_menu_style = "this"
  end
end
