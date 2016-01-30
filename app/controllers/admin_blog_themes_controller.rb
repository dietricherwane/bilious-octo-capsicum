class AdminBlogThemesController < ApplicationController
  layout "administrator"
  before_filter :set_menu_css, only: [:blog_theme, :create_blog_theme, :list_blog_themes, :disable_blog_theme, :enable_blog_theme, :edit_blog_theme, :update_blog_theme]

  def blog_theme
    @blog_theme = BlogTheme.new
  end

  def create_blog_theme
    @blog_theme = BlogTheme.new(params.require(:blog_theme).permit(:title, :blogger_id, :blog_category_id, :content, :descriptive_image).merge(created_by: (current_user.id rescue nil)))

    if @blog_theme.save
      flash.now[:success] = "Le thème de blog a été correctement créé."
      @blog_theme = BlogTheme.new
    else
      flash[:error] = @blog_theme.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    redirect_to admin_blog_theme_path
  end

  def edit_blog_theme
    @blog_theme = BlogTheme.find_by_id(params[:blog_theme_id])

    if @blog_theme.blank?
      flash[:error] = "Ce thème de blog n'existe pas"
      redirect_to admin_list_blog_categories_path
    end
  end

  def update_blog_theme
    @blog_theme = BlogTheme.find_by_id(params[:blog_theme][:id])

    unless @blog_theme
      flash.now[:error] = "Ce thème de blog n'existe pas."
      redirect_to :back
    else
      @blog_theme.assign_attributes(params.require(:blog_theme).permit(:title, :blogger_id, :blog_category_id, :content, :descriptive_image))
      if @blog_theme.valid?
        @blog_theme.save
        flash.now[:success] = "Le thème de blog a été mis à jour."
      else
        flash.now[:error] = @blog_theme.errors.full_messages.map { |msg| "#{msg}<br />" }.join
      end
    end

    render :edit_blog_theme
  end

  def list_blog_themes
    @blog_themes = BlogTheme.all.order("created_at DESC")
  end

  def disable_blog_theme
    enable_disable_blog_theme(params[:blog_theme_id], false, "désactivé")
  end

  def enable_blog_theme
    enable_disable_blog_theme(params[:blog_theme_id], true, "activé")
  end

  private
    def set_menu_css
      @website_blog_menu_style = "current"
      @blog_themes_menu_style = "this"
      @blog_categories = BlogCategory.where("published IS NOT FALSE")
      @bloggers = Blogger.where("published IS NOT FALSE")
    end

    def enable_disable_blog_theme(blog_theme_id, status, status_text)
      blog_theme = BlogTheme.find_by_id(blog_theme_id)

      if blog_theme.blank?
        flash[:error] = "Ce thème de blog n'existe pas."
      else
        blog_theme.update_attributes(published: status)
        flash[:success] = "Le thème de blog a été #{status_text}."
      end

      redirect_to admin_list_blog_themes_path
    end
end
