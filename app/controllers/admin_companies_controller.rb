class AdminCompaniesController < ApplicationController

  layout "administrator"
  before_filter :authenticate_user!

  def companies
    @companies = Company.all.order("created_at DESC")

    @website_job_menu_style = "current"
    @registered_companies_menu_style = "this"
  end

  def renew_registration
    @company = Company.find_by_id(params[:company_id])
    @website_job_menu_style = "current"
    @registered_companies_menu_style = "this"

    if @company.blank?
      flash[:error] = "Cette compagnie n'existe pas."
      redirect_to :back
    else
      transaction_id = Digest::SHA1.hexdigest([DateTime.now.iso8601(6), rand].join).hex.to_s[0..17]
      subscription_formula = SubscriptionFormula.first
      subscriptions = @company.subscriptions.order("end_date DESC").first rescue nil

      if subscriptions.blank?
        @company.subscriptions.create(subscription_formula_id: subscription_formula.id, transaction_id: transaction_id, begin_date: Date.today, end_date: (Date.today + subscription_formula.duration.days), renewed_by: current_user.id, renewed_at: DateTime.now)
      else
        @company.subscriptions.create(subscription_formula_id: subscription_formula.id, transaction_id: transaction_id, begin_date: subscriptions.end_date, end_date: (subscriptions.end_date + subscription_formula.duration.days), renewed_by: current_user.id, renewed_at: DateTime.now)
      end
      flash[:success] = "L'abonnement de l'entreprise #{@company.name} a été renouvellé pour #{subscription_formula.duration} jours."
    end

    redirect_to admin_registered_companies_path
  end

  def registrations
    @company = Company.find_by_id(params[:company_id])
    @website_job_menu_style = "current"
    @registered_companies_menu_style = "this"

    if @company.blank?
      flash[:error] = "Cette compagnie n'existe pas."
      redirect_to :back
    else
      @subscriptions = @company.subscriptions.order("created_at DESC")
    end
  end
end
