class ActivitiesController < ApplicationController
  before_filter :authenticate_user!
  layout "administrator", only: [:index, :create, :edit, :list, :update]

  def index
    init_activities

    @activity = Activity.new
  end

  def create
    init_activities

    activity = params[:activity]
    @activity = Activity.new(params.require(:activity).permit(:activity_category_id, :fr_title, :en_title, :fr_content, :en_content, :publication_date, :user_id, :attachments_array, :videos).merge(user_id: (current_user.id rescue nil), publication_date: Date.new(activity["publication_date(1i)"].to_i, activity["publication_date(2i)"].to_i, activity["publication_date(3i)"].to_i)))

    if @activity.save
      unless params[:activity][:attachments_array].blank?
        params[:activity][:attachments_array].each do |key, array|
          @activity.activity_attachments.create(activity_id: @activity.id, attachment: key)
        end
      end
      flash.now[:success] = "L'activité a été correctement créée."
      @activity = Activity.new
    else
      flash.now[:error] = @activity.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :index
  end

  def edit
    init_activities

    @activity = Activity.find_by_id(params[:activity_id])
    @video_links = @activity.videos.to_s.strip.split("|") rescue []

    if @activity.blank?
      flash[:error] = "Cette activité n'existe pas."
      redirect_to list_activities_path
    end
  end

  def update
    init_activities

    @activity = Activity.find_by_id(params[:activity][:id])
    @video_links = @activity.videos.to_s.strip.split("|") rescue []

    if @activity.blank?
      flash.now[:error] = "Cette activité n'existe pas."
      redirect_to list_activities_path
    else
      activity_params = params.require(:activity).permit(:activity_category_id, :fr_title, :en_title, :fr_content, :en_content, :publication_date, :user_id, :attachments_array, :videos).merge(publication_date: Date.new(params[:activity]["publication_date(1i)"].to_i, params[:activity]["publication_date(2i)"].to_i, params[:activity]["publication_date(3i)"].to_i))

      @activity.assign_attributes(activity_params)
      if @activity.valid?
        @activity.save
        flash.now[:success] = "L'activité a été mise à jour."
        unless params[:activity][:attachments_array].blank?
          params[:activity][:attachments_array].each do |key, array|
            @activity.activity_attachments.create(activity_id: @activity.id, attachment: key)
          end
        end
      else
        flash.now[:error] = @activity.errors.full_messages.map { |msg| "#{msg}<br />" }.join
      end
    end

    render :edit
  end

  def delete_image
    activity_attachment = ActivityAttachment.find_by_id(params[:activity_attachment_id])

    if activity_attachment.blank?
      flash[:error] = "Cette image n'existe pas."
    else
      activity = activity_attachment.activity
      activity_attachment.delete

      flash[:success] = "L'image a été supprimée."
    end

    redirect_to edit_activity_path(activity.id)
  end

  def list
    @activities = Activity.all

    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"
  end

  def disable_activity
    activity = Activity.find_by_id(params[:activity_id])

    if activity
      flash[:success] = "L'activité a été désactivée."
      activity.update_attributes(published: false)
    else
      flash[:error] = "Cette activité n'existe pas."
    end

    redirect_to list_activities_path
  end

  def enable_activity
    activity = Activity.find_by_id(params[:activity_id])

    if activity
      flash[:success] = "L'activité a été activée."
      activity.update_attributes(published: true)
    else
      flash[:error] = "Cette activité n'existe pas."
    end

    redirect_to list_activities_path
  end

  def init_activities
    @activity_categories = ActivityCategory.where("published IS NOT FALSE").order('publication_date DESC')

    @website_content_menu_style = "current"
    @activities_website_content_menu_style = "this"
  end

end
