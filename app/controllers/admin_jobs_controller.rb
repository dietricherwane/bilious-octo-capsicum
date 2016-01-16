class AdminJobsController < ApplicationController
  layout "administrator"

  def admin_list_jobs
    @offers = Offer.where("validated IS NULL").order("created_at DESC")

    @website_job_menu_style = "current"
    @offer_website_job_menu_style = "this"
  end

  def admin_new_offer
    init_offer_form
    @offer = Offer.new
  end

  def admin_create_offer
    init_offer_form

    expiration_date = params[:offer]
    expiration_date = Date.new(expiration_date["expiration_date(1i)"].to_i, expiration_date["expiration_date(2i)"].to_i, expiration_date["expiration_date(3i)"].to_i)

    @offer = Offer.new(params.require(:offer).permit(:activity_field_id, :title, :description, :studies_level_id, :min_years_of_experience, :max_years_of_experience, :profile, :contract_type_id, :country_id, :city, :position_available).merge({user_id: (current_user.id rescue nil), expiration_date: expiration_date, validated: true, validated_by: current_user.id, validated_at: DateTime.now}))

    if (expiration_date < Date.today rescue true)
      @offer.errors.add(:expiration_date, "n'est pas valide")
    end

    if @offer.save
      flash.now[:success] = "Votre offre a été correctement créée et validée."
      @offer = Offer.new
    else
      flash.now[:error] = @offer.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :admin_new_offer
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
      offer.assign_attributes(validated: false, validated_by: current_user.id, validated_at: DateTime.now)
      if offer.save
        flash[:success] = "L'offre a été rejetée."
      else
        flash[:error] = offer.errors.full_messages.map { |msg| "#{msg}<br />" }.join
      end
    else
      flash[:error] = "Cette offre n'a pas été trouvée."
    end

    redirect_to :back
  end

  def init_offer_form
    @activity_fields = ActivityField.where("published IS NOT FALSE")
    @studies_levels = StudiesLevel.where("published IS NOT FALSE").order("id")
    @contract_types = ContractType.where("published IS NOT FALSE").order("id")
    @countries = Country.where("published IS NOT FALSE").order("name")

    @website_job_menu_style = "current"
    @offer_new_menu_style = "this"
  end

end
