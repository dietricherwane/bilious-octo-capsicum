class AdminJobsController < ApplicationController
  layout "administrator"

  def admin_list_jobs
    @offers = Offer.where("validated IS NULL").order("created_at DESC")

    @website_job_menu_style = "current"
    @offer_website_job_menu_style = "this"
  end

  def admin_list_validated_jobs
    @offers = Offer.where("validated IS NOT NULL").order("created_at DESC")

    @website_job_menu_style = "current"
    @offer_website_validated_job_menu_style = "this"
  end

  def admin_job_details
    @offer = Offer.find_by_id(params[:offer_id])
    @website_job_menu_style = "current"

    if @offer.blank?
      redirect_to admin_list_validated_jobs_path
    end
  end

  def admin_validate_offer
    offer = Offer.where("id = #{params[:offer_id]}").first rescue nil

    if !offer.blank?
      offer.update_attributes(validated: true, validated_by: current_user.id, validated_at: DateTime.now)
      flash[:success] = "L'offre a été validée."
    else
      flash[:error] = "Cette offre n'a pas été trouvée."
    end

    redirect_to :back
  end

  def admin_reject_offer
    offer = Offer.where("id = #{params[:offer_id]}").first rescue nil

    if !offer.blank?
      offer.update_attributes(validated: false, validated_by: current_user.id, validated_at: DateTime.now)
      flash[:success] = "L'offre a été rejetée."
    else
      flash[:error] = "Cette offre n'a pas été trouvée."
    end

    redirect_to :back
  end

end
