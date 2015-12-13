class HomeController < ApplicationController

  layout "front"

  def index
    select_front_menu_highlight_class("home_menu_highlight_style")

    set_front_page_content
  end

  def focus_on_woman
    select_front_menu_highlight_class("home_menu_highlight_style")

    set_front_page_content
  end

  def activities
    select_front_menu_highlight_class("home_menu_highlight_style")

    @activity_categories = ActivityCategory.where("published IS NOT FALSE").order("publication_date DESC")

    set_front_page_content
  end

  def gallery
    select_front_menu_highlight_class("gallery_menu_highlight_style")

    @gallery_categories = GalleryCategory.where("published IS NOT FALSE").order("publication_date DESC")

    set_front_page_content
  end

  def activities_details
    select_front_menu_highlight_class("home_menu_highlight_style")
    activity_category = ActivityCategory.find_by_id(params[:activity_category_id])

    if activity_category.blank?
      redirect_to :back
    else
      @activities = activity_category.activities.where("published IS NOT FALSE").page(params[:page]).per(1)
    end

    set_front_page_content
  end

  def blog
    select_front_menu_highlight_class("blog_menu_highlight_style")

    set_front_page_content
  end

  def job
    set_front_page_content
  end

  def contact
    select_front_menu_highlight_class("contact_menu_highlight_style")

    set_front_page_content
  end

  def compendium
    select_front_menu_highlight_class("compendium_menu_highlight_style")

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
