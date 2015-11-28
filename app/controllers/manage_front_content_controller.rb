class ManageFrontContentController < ApplicationController
  layout :select_layout

  def home_page
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()
  end
end
