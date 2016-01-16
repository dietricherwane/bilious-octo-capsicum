class CompaniesController < ApplicationController

  before_filter :authenticate_company!, except: [:list_offers]

  layout "job"

  def new_offer
    init_company_form
    @offer = Offer.new
  end

  def create_offer
    init_company_form
    expiration_date = params[:offer]
    expiration_date = Date.new(expiration_date["expiration_date(1i)"].to_i, expiration_date["expiration_date(2i)"].to_i, expiration_date["expiration_date(3i)"].to_i)

    @offer = Offer.new(params.require(:offer).permit(:activity_field_id, :title, :description, :studies_level_id, :min_years_of_experience, :max_years_of_experience, :profile, :contract_type_id, :country_id, :city, :position_available).merge({company_id: (current_company.id rescue nil), expiration_date: expiration_date}))

    if @offer.save
      flash.now[:success] = "Votre offre a été correctement créée. Elle sera soumise à l'administrateur pour validation."
      @offer = Offer.new
    else
      flash.now[:error] = @offer.errors.full_messages.map { |msg| "#{msg}<br />" }.join
    end

    render :new_offer
  end

  def list_offers
    @offers = Offer.where("validated IS TRUE AND expiration_date <= '#{Date.today.strftime("%d-%m-%Y")}'").order("created_at DESC")
    @total_validated_offers = Offer.where("validated IS TRUE").count
    @total_number_of_companies = Company.all.count
  end

  def init_company_form
    @activity_fields = ActivityField.where("published IS NOT FALSE")
    @studies_levels = StudiesLevel.where("published IS NOT FALSE").order("id")
    @contract_types = ContractType.where("published IS NOT FALSE").order("id")
    @countries = Country.where("published IS NOT FALSE").order("name")
  end

end
