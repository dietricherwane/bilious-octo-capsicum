class JobsController < ApplicationController
  layout "job"

  def details
    @offer = Offer.find_by_id(params[:offer_id])

    if @offer.blank?
      redirect_to jobs_path
    end
  end

end
