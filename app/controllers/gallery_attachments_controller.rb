class GalleryAttachmentsController < ApplicationController

  before_filter :authenticate_user!
  layout "administrator", only: [:update]

  def update
    @gallery_attachment = GalleryAttachment.find_by_id(params[:gallery_attachment][:id])
    @website_content_menu_style = "current"
    @gallery_website_content_menu_style = "this"

    unless @gallery_attachment
      flash.now[:error] = "Cette pièce jointe n'existe pas."
      redirect_to list_gallery_categories_path
    else
      @gallery_attachment.update_attributes(params.require(:gallery_attachment).permit(:fr_description, :en_description, :id))
      flash[:success] = "La catégorie de galeries a été mise à jour."

      redirect_to edit_gallery_category_path(@gallery_attachment.gallery_category.id)
    end
  end

end
