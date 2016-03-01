class JobsController < ApplicationController
  layout "job"

  def details
    @offer = Offer.find_by_id(params[:offer_id])

    if @offer.blank?
      redirect_to jobs_path
    end
  end

  def list_offers
    @offers = Offer.where("validated IS TRUE AND expiration_date >= '#{Date.today}'").order("created_at DESC")
    init_offers
  end

  def search
    init_offers

    @activity_field_id = params[:activity_field_id]
    @contract_type_id = params[:contract_type_id]
    @studies_level_id = params[:studies_level_id]
    @years_of_experience = params[:years_of_experience]
    @title = params[:title]

    set_sql_search_options

    @offers = Offer.where("#{@sql_for_activity_field} #{@sql_for_contract_type} #{@sql_for_studies_level} #{@sql_for_years_of_experience} #{(@sql_for_activity_field.blank? && @sql_for_contract_type.blank? && @sql_for_studies_level.blank? && @sql_for_years_of_experience.blank?) ? "" : "AND"} validated IS TRUE AND expiration_date >= '#{Date.today}'").order("created_at DESC")
  end

  def set_sql_search_options
    @sql_for_activity_field = ""
    @sql_for_contract_type = ""
    @sql_for_studies_level = ""
    @sql_for_years_of_experience = ""
    @sql_for_title = ""

    unless @activity_field_id.blank?
      @sql_for_activity_field = "activity_field_id = #{@activity_field_id}"
    end
    unless @contract_type_id.blank?
      @sql_for_contract_type = "#{@sql_for_activity_field.blank? ? "" : "AND"} contract_type_id = #{@contract_type_id}"
    end
    unless @studies_level_id.blank?
      @sql_for_studies_level = "#{(@sql_for_activity_field.blank? && @sql_for_contract_type.blank?) ? "" : "AND"} studies_level_id = #{@studies_level_id}"
    end
    unless @years_of_experience.blank?
      @years_of_experience = params[:years_of_experience].to_i rescue 0
      @sql_for_years_of_experience = "#{(@sql_for_activity_field.blank? && @sql_for_contract_type.blank? && @sql_for_studies_level.blank?) ? "" : "AND"} min_years_of_experience <= #{@years_of_experience} AND max_years_of_experience >= #{@years_of_experience}"
    end
=begin
    unless @title.blank?
      @sql_for_title = "#{(@sql_for_activity_field.blank? && @sql_for_activity_field.blank? && @sql_for_studies_level.blank?) ? "" : "AND"} title ILIKE '%#{@studies_level_id}%'"
    end
=end
  end

  def init_offers
    @total_validated_offers = Offer.where("validated IS TRUE").count
    @total_number_of_companies = Company.all.count
    @activity_fields = ActivityField.where("published IS NOT FALSE").order("name ASC")
    @contract_types = ContractType.where("published IS NOT FALSE").order("id")
    @studies_levels = StudiesLevel.where("published IS NOT FALSE").order("id")
  end

end
