class ActivityCategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout "administrator", only: [:index, :create, :list, :edit, :update]

  def index
    @activity_category = ActivityCategory.new

    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"
  end

  def create
    activity_category = params[:activity_category]
    @activity_category = ActivityCategory.new(params.require(:activity_category).permit(:fr_title, :en_title, :user_id).merge(user_id: (current_user.id rescue nil), publication_date: Date.new(activity_category["publication_date(1i)"].to_i, activity_category["publication_date(2i)"].to_i, activity_category["publication_date(3i)"].to_i)))


    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"

    if @activity_category.save
      flash.now[:success] = "La catégorie d'activité a été correctement créée."
      @activity_category = ActivityCategory.new
    else
      flash.now[:error] = @activity_category.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :index
  end

  def edit
    @activity_category = ActivityCategory.find_by_id(params[:activity_category_id])

    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"

    unless @activity_category
      flash[:error] = "La catégorie d'activités n'a pas été trouvée."

      redirect_to list_activity_categories_path
    end
  end

  def update
    @activity_category = ActivityCategory.find_by_id(params[:activity_category][:id])
    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"


    unless @activity_category
      flash.now[:error] = "Cette catégorie d'activités n'existe pas."
      redirect_to list_activity_categories_path
    else
      activity_category_params = params.require(:activity_category).permit(:fr_title, :en_title, :publication_date).merge(publication_date: Date.new(params[:activity_category]["publication_date(1i)"].to_i, params[:activity_category]["publication_date(2i)"].to_i, params[:activity_category]["publication_date(3i)"].to_i))

      @activity_category.assign_attributes(activity_category_params)
      if @activity_category.valid?
        @activity_category.save
        flash.now[:success] = "La catégorie d'activités a été mise à jour."
      else
        flash.now[:error] = @activity_category.errors.full_messages.map { |msg| "#{msg}<br />" }.join
      end
    end

    render :edit
  end

  def list
    @activity_categories = ActivityCategory.all

    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"
  end

  def disable_activity_category
    activity_category = ActivityCategory.find_by_id(params[:activity_category_id])

    if activity_category
      flash[:success] = "La catégorie a été désactivée."
      activity_category.update_attributes(published: false)
    else
      flash[:error] = "Cette catégorie n'existe pas."
    end

    redirect_to list_activity_categories_path
  end

  def enable_activity_category
    activity_category = ActivityCategory.find_by_id(params[:activity_category_id])

    if activity_category
      flash[:success] = "La catégorie a été activée."
      activity_category.update_attributes(published: true)
    else
      flash[:error] = "Cette catégorie n'existe pas."
    end

    redirect_to list_activity_categories_path
  end

end
