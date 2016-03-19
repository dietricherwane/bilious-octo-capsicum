class AdminBlogCategoriesController < ApplicationController
  layout "administrator"
  before_filter :authenticate_user!
  before_filter :set_menu_css, only: [:blog_category, :create_blog_category, :list_blog_categories, :disable_blog_category, :enable_blog_category, :edit_blog_category, :update_blog_category]

  def blog_category
    @blog_category = BlogCategory.new
  end

  def create_blog_category
    @blog_category = BlogCategory.new(params.require(:blog_category).permit(:title).merge(created_by: (current_user.id rescue nil)))

    if @blog_category.save
      flash.now[:success] = "La catégorie de blog a été correctement créée."
      @blog_category = BlogCategory.new
    else
      flash.now[:error] = @blog_category.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :blog_category
  end

  def edit_blog_category
    @blog_category = BlogCategory.find_by_id(params[:blog_category_id])

    if @blog_category.blank?
      flash[:error] = "Cette catégorie de blog n'existe pas"
      redirect_to admin_list_blog_categories_path
    end
  end

  def update_blog_category
    @blog_category = BlogCategory.find_by_id(params[:blog_category][:id])

    unless @blog_category
      flash.now[:error] = "Cette catégorie de blog n'existe pas."
      redirect_to :back
    else
      @blog_category.assign_attributes(params.require(:blog_category).permit(:title))
      if @blog_category.valid?
        @blog_category.save
        flash.now[:success] = "La catégorie de blog a été mise à jour."
      else
        flash.now[:error] = @blog_category.errors.full_messages.map { |msg| "#{msg}<br />" }.join
      end
    end

    render :edit_blog_category
  end

  def list_blog_categories
    @blog_categories = BlogCategory.all.order("created_at DESC")
  end

  def disable_blog_category
    enable_disable_blog_category(params[:blog_category_id], false, "désactivée")
  end

  def enable_blog_category
    enable_disable_blog_category(params[:blog_category_id], true, "activée")
  end

  private
    def set_menu_css
      @website_blog_menu_style = "current"
      @blog_categories_menu_style = "this"
    end

    def enable_disable_blog_category(blog_category_id, status, status_text)
      blog_category = BlogCategory.find_by_id(blog_category_id)

      if blog_category.blank?
        flash[:error] = "Cette catégorie de blog n'existe pas."
      else
        blog_category.update_attributes(published: status)
        flash[:success] = "La catégorie a été #{status_text}."
      end

      redirect_to admin_list_blog_categories_path
    end
end
