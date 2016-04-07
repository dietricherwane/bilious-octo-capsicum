class GalleryCategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout "administrator", only: [:index, :create, :list, :edit, :update]

  def index
    @gallery_category = GalleryCategory.new
    @gallery_types = GalleryType.all
    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()

    @website_content_menu_style = "current"
    @gallery_website_content_menu_style = "this"
  end

  def create
    gallery_category = params[:gallery_category]
    @gallery_types = GalleryType.all
    @gallery_category = GalleryCategory.new(params.require(:gallery_category).permit(:fr_title, :en_title, :fr_description, :en_description, :user_id, :publication_date, :photos_attachments_array, :pdf_attachments_array, :gallery_type_id, :id, :video_links).merge(user_id: (current_user.id rescue nil), publication_date: Date.new(gallery_category["publication_date(1i)"].to_i, gallery_category["publication_date(2i)"].to_i, gallery_category["publication_date(3i)"].to_i)))
    captchi = params[:"g-recaptcha-response"]
    captchi_status = true

    if captchi.blank? || captchi.length < 200
      captchi = "Le captcha n'est pas valide"
      captchi_status = false
    else
      captchi = ""
    end

    @fr_content = FrFrontPageContent.first || FrFrontPageContent.create()
    @en_content = EnFrontPageContent.first || EnFrontPageContent.create()
    @website_content_menu_style = "current"
    @gallery_website_content_menu_style = "this"

    if captchi_status && @gallery_category.save
      unless params[:gallery_category][:photos_attachments_array].blank?
        params[:gallery_category][:photos_attachments_array].each do |key, array|
          @gallery_category.gallery_attachments.create(gallery_category_id: @gallery_category.id, photo_attachment: key)
        end
      end
      unless params[:gallery_category][:pdf_attachments_array].blank?
        params[:gallery_category][:pdf_attachments_array].each do |key, array|
          @gallery_category.gallery_attachments.create(gallery_category_id: @gallery_category.id, pdf_attachment: key)
        end
      end
      flash.now[:success] = "La catégorie de galerie a été correctement créée."
      @gallery_category = GalleryCategory.new
    else
      flash.now[:error] = @gallery_category.errors.full_messages.map { |msg| "#{msg}<br />" }.join + captchi
    end

    render :index
  end

  def edit
    @gallery_category = GalleryCategory.find_by_id(params[:gallery_category_id])
    @gallery_types = GalleryType.all

    @website_content_menu_style = "current"
    @gallery_website_content_menu_style = "this"

    unless @gallery_category
      flash[:error] = "La catégorie de galeries n'a pas été trouvée."

      redirect_to list_gallery_categories_path
    end

    @video_links = @gallery_category.video_links.to_s.strip.split("|") rescue []
  end

  def update
    @gallery_category = GalleryCategory.find_by_id(params[:gallery_category][:id])
    params[:gallery_attachment_id] = params[:gallery_category][:id]
    @gallery_types = GalleryType.all
    @website_content_menu_style = "current"
    @gallery_website_content_menu_style = "this"
    @video_links = @gallery_category.video_links.to_s.strip.split("|") rescue []
    #captchi = ""
    #if verify_recaptcha == false
      #captchi = "Le captcha n'est pas valide"
    #end

    unless @gallery_category
      flash.now[:error] = "Cette catégorie de galeries n'existe pas."
      redirect_to list_gallery_categories_path
    else
      gallery_category_params = params.require(:gallery_category).permit(:fr_title, :en_title, :fr_description, :en_description, :publication_date, :photos_attachments_array, :pdf_attachments_array, :gallery_type_id, :id, :video_links).merge(publication_date: Date.new(params[:gallery_category]["publication_date(1i)"].to_i, params[:gallery_category]["publication_date(2i)"].to_i, params[:gallery_category]["publication_date(3i)"].to_i))

      @gallery_category.assign_attributes(gallery_category_params)
      if @gallery_category.valid?
        unless params[:gallery_category][:photos_attachments_array].blank?
          params[:gallery_category][:photos_attachments_array].each do |key, array|
            @gallery_category.gallery_attachments.create(gallery_category_id: @gallery_category.id, photo_attachment: key)
          end
        end
        unless params[:gallery_category][:pdf_attachments_array].blank?
          params[:gallery_category][:pdf_attachments_array].each do |key, array|
            @gallery_category.gallery_attachments.create(gallery_category_id: @gallery_category.id, pdf_attachment: key)
          end
        end
        @gallery_category.save
        flash.now[:success] = "La catégorie de galeries a été mise à jour."
      else
        flash.now[:error] = @gallery_category.errors.full_messages.map { |msg| "#{msg}<br />" }.join #+ captchi
      end
    end

    render :edit
  end

  def delete_attachment
    gallery_attachment = GalleryAttachment.find_by_id(params[:gallery_attachment_id])

    if gallery_attachment.blank?
      flash[:error] = "Ce fichier n'existe pas."
    else
      gallery_category = gallery_attachment.gallery_category
      gallery_attachment.delete

      flash[:success] = "Le fichier a été supprimé."
    end

    redirect_to edit_gallery_category_path(gallery_category.id)
  end

  def list
    @gallery_categories = GalleryCategory.all

    @website_content_menu_style = "current"
    @gallery_website_content_menu_style = "this"
  end

  def disable_gallery_category
    gallery_category = GalleryCategory.find_by_id(params[:gallery_category_id])

    if gallery_category
      flash[:success] = "La catégorie a été désactivée."
      gallery_category.update_attributes(published: false)
    else
      flash[:error] = "Cette catégorie n'existe pas."
    end

    redirect_to list_gallery_categories_path
  end

  def enable_gallery_category
    gallery_category = GalleryCategory.find_by_id(params[:gallery_category_id])

    if gallery_category
      flash[:success] = "La catégorie a été activée."
      gallery_category.update_attributes(published: true)
    else
      flash[:error] = "Cette catégorie n'existe pas."
    end

    redirect_to list_gallery_categories_path
  end

end
