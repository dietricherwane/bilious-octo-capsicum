class HomeController < ApplicationController


  layout "front"

  def index
    select_front_menu_highlight_class("home_menu_highlight_style")
  end

end
