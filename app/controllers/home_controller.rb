class HomeController < ApplicationController

  layout "front"

  def index
    select_front_menu_highlight_class("home_menu_highlight_style")

    set_front_page_content
  end

  def contact
    select_front_menu_highlight_class("contact_menu_highlight_style")

    set_front_page_content
  end

  def set_user_locale
    previous_locale = I18n.locale
    I18n.locale = params[:user_locale]

    if request.base_url + "/" == request.referrer
      back_url = request.referrer + I18n.locale.to_s
    else
      back_url = request.referrer.sub(previous_locale.to_s, I18n.locale.to_s)
    end

    set_front_page_content

    redirect_to back_url
  end

end
