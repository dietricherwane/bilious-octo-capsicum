class AdminContactMessagesController < ApplicationController
  before_filter :authenticate_user!
  layout "administrator"

  def index
    @class_contact_messages = "active"
    @contact_forms = ContactForm.all.order("created_at DESC")
  end

  def details
    @contact_form = ContactForm.find_by_id(params[:contact_message_id])
    @class_contact_messages = "active"

    if @contact_form.blank?
      redirect_to admin_contact_messages_path
    end
  end

end
