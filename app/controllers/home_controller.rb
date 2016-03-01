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
    select_front_menu_highlight_class("activities_menu_highlight_style")

    @activity_categories = ActivityCategory.where("published IS NOT FALSE").order("publication_date DESC")
    @last_activity = Activity.where("published IS NOT FALSE").order("publication_date DESC").first rescue nil
    @last_activity_category = @last_activity.activity_category rescue nil
    @attachments = @last_activity.activity_attachments

    set_front_page_content
  end

  def gallery
    select_front_menu_highlight_class("gallery_menu_highlight_style")

    @photo_galleries = GalleryType.find_by_name("Photos").gallery_categories
    @video_galleries = GalleryType.find_by_name("Videos").gallery_categories
    @documents_galleries = GalleryType.find_by_name("Documents").gallery_categories

    @gallery_categories = GalleryCategory.where("published IS NOT FALSE").order("publication_date DESC")

    set_front_page_content
  end

  def photo_gallery
    select_front_menu_highlight_class("gallery_menu_highlight_style")
    set_front_page_content

    @photo_galleries = GalleryType.find_by_name("Photos").gallery_categories.page(params[:page]).per(12)
  end

  def photo_gallery_details
    @gallery_category = GalleryCategory.find_by_id(params[:gallery_category_id])
    select_front_menu_highlight_class("gallery_menu_highlight_style")
    set_front_page_content

    if @gallery_category.blank?
      redirect_to :back
    end
  end

  def documents_gallery
    select_front_menu_highlight_class("gallery_menu_highlight_style")
    set_front_page_content

    @documents_galleries = GalleryType.find_by_name("Documents").gallery_categories.page(params[:page]).per(6)
  end

  def documents_gallery_details
    @gallery_category = GalleryCategory.find_by_id(params[:gallery_category_id])
    select_front_menu_highlight_class("gallery_menu_highlight_style")
    set_front_page_content

    if @gallery_category.blank?
      redirect_to :back
    end
  end

  def video_gallery
    select_front_menu_highlight_class("gallery_menu_highlight_style")
    set_front_page_content

    @video_galleries = GalleryType.find_by_name("Videos").gallery_categories.page(params[:page]).per(6)
  end

  def video_gallery_details
    @gallery_category = GalleryCategory.find_by_id(params[:gallery_category_id])
    select_front_menu_highlight_class("gallery_menu_highlight_style")
    set_front_page_content

    if @gallery_category.blank?
      redirect_to :back
    end
  end

  def activities_details_list
    select_front_menu_highlight_class("activities_menu_highlight_style")
    @activity_category = ActivityCategory.find_by_id(params[:activity_category_id])

    if @activity_category.blank?
      redirect_to :back
    else
      @activities_details_list = @activity_category.activities.where("published IS NOT FALSE").order("publication_date DESC")
    end

    set_front_page_content
  end

  def activity_details
    select_front_menu_highlight_class("activities_menu_highlight_style")
    @activity = Activity.find_by_id(params[:activity_id])
    @video_links = @activity.videos.to_s.strip.split("|") rescue []

    if @activity.blank?
      redirect_to :back
    end

    @activity_category = @activity.activity_category
    @activities_details_list = @activity_category.activities.where("published IS NOT FALSE").order("publication_date DESC")

    set_front_page_content
  end

  def directory
    select_front_menu_highlight_class("directory_menu_highlight_style")
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

  def blogger_posts
    @blogger = Blogger.find_by_id(params[:blogger_id])

    if @blogger.blank?
      redirect_to blog_path
    end

    init_blog
  end

  def blogger_biography
    @blogger = Blogger.find_by_id(params[:blogger_id])

    if @blogger.blank?
      redirect_to blog_path
    end

    init_blog
  end

  def blog_theme
    @blog_theme = BlogTheme.find_by_id(params[:blog_theme_id])
    @blog_post = BlogPost.new
    #@blog_posts = @blog_theme.blog_posts.order("created_at DESC")
    #@blog_categories = BlogCategory.where("published IS NOT FALSE").order("created_at DESC")

    init_blog

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
    @contact_form = ContactForm.new

    set_front_page_content
  end

  def submit_contact
    @name = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    @content = params[:content]
    select_front_menu_highlight_class("contact_menu_highlight_style")

    set_front_page_content

    @contact_form = ContactForm.new(params.require(:contact_form).permit(:name, :email, :subject, :content))

    if @contact_form.save
      flash.now[:success] = "Votre message au COCOFCI a été envoyé."
      @contact_form = ContactForm.new
      Notifier.contact_email(@name, @email, @subject, @content).deliver
    else
      flash[:error] = @contact_form.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :contact
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
    @bloggers = Blogger.where("published IS NOT FALSE")
    @recent_blogs = BlogTheme.where("published IS NOT FALSE").order("created_at DESC").limit(5)
  end

end
