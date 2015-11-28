class HomeController < ApplicationController

  layout "front"

  def index
    select_front_menu_highlight_class("home_menu_highlight_style")

    set_front_page_content
  end

  def set_user_locale
    previous_locale = I18n.locale
    I18n.locale = params[:user_locale]

    set_front_page_content

    redirect_to request.referrer.sub(previous_locale.to_s, I18n.locale.to_s)
  end

end
