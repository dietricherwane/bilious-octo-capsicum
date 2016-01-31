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

  def activities_details_list
    select_front_menu_highlight_class("home_menu_highlight_style")
    @activity_category = ActivityCategory.find_by_id(params[:activity_category_id])

    if @activity_category.blank?
      redirect_to :back
    else
      @activities_details_list = @activity_category.activities.where("published IS NOT FALSE").order("publication_date DESC")
    end

    set_front_page_content
  end

  def activity_details
    select_front_menu_highlight_class("home_menu_highlight_style")
    @activity = Activity.find_by_id(params[:activity_id])

    if @activity.blank?
      redirect_to :back
    end

    set_front_page_content
  end

  def blog
    init_blog
  end

  def blog_category
    @blog_category = BlogCategory.find_by_id(params[:blog_category_id])

    if @blog_category.blank?
      redirect_to blog_path
    end

    init_blog
  end

  def blog_theme
    @blog_theme = BlogTheme.find_by_id(params[:blog_theme_id])
    @blog_post = BlogPost.new
    @blog_posts = @blog_theme.blog_posts.order("created_at DESC")
    @blog_categories = BlogCategory.where("published IS NOT FALSE").order("created_at DESC")

    if @blog_theme.blank?
      redirect_to blog_path
    end

    @blog_posts = @blog_theme.blog_posts.where("published IS NOT FALSE")
    select_front_menu_highlight_class("blog_menu_highlight_style")
    set_front_page_content
  end

  def create_blog_post
    @blog_post = BlogPost.new(params.require(:blog_post).permit(:firstname, :lastname, :email, :content, :blog_theme_id))
    @blog_theme = @blog_post.blog_theme
    @blog_posts = @blog_theme.blog_posts.order("created_at DESC")
    @blog_categories = BlogCategory.where("published IS NOT FALSE").order("created_at DESC")
    select_front_menu_highlight_class("blog_menu_highlight_style")
    set_front_page_content

    if @blog_post.save
      flash.now[:success] = "Votre message a été enregistré."
      @blog_post = BlogPost.new
    else
      flash.now[:error] = @blog_post.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :blog_theme
  end

  def list_blogger_blog_themes
    @blogger = Blogger.find_by_id(params[:blogger_id])
    @blog_categories = BlogCategory.where("published IS NOT FALSE").order("created_at DESC")
    select_front_menu_highlight_class("blog_menu_highlight_style")
    set_front_page_content

    if @blogger.blank?
      redirect_to :back
    else
      @blog_themes = @blogger.blog_themes.where("published IS NOT FALSE").order("created_at DESC").page(params[:page]).per(3)
    end
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

  def responsible1
    select_front_menu_highlight_class("compendium_menu_highlight_style")

    set_front_page_content
  end

  def responsible2
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

  def init_blog
    select_front_menu_highlight_class("blog_menu_highlight_style")
    set_front_page_content
    @blog_categories = BlogCategory.where("published IS NOT FALSE").order("created_at DESC")
    @blog_themes = BlogTheme.where("published IS NOT FALSE").order("created_at DESC").page(params[:page]).per(3)
  end

end
