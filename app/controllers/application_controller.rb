class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  def after_sign_out_path_for(resource_or_scope)
	  new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    new_user_registration_path
  end

  def select_layout
    profile = current_user.profile.shortcut rescue ""

    case profile
      when "AUD"
        "administrator"
      when "ADM"
        "administrator"
      when "S-ADM"
        "administrator"
      else
        false
      end
  end

  def sign_out_disabled_users
    if current_user.published == false
      sign_out(current_user)
      flash[:alert] = "Votre compte a été désactivé. Veuillez contacter l'administrateur."

      redirect_to new_user_session_path
    end
  end

  def skip_login_page_for_registered_users
    if !current_user.blank?
      redirect_to new_user_registration_path
    end
  end

  def select_front_menu_highlight_class(current_menu)
    @home_menu_highlight_style = @compendium_menu_highlight_style = @blog_menu_highlight_style = @gallery_menu_highlight_style = @contact_menu_highlight_style = "menu-item-has-children"

    instance_variable_set(("@" + current_menu), "current-menu-parent menu-item-has-children")
  end

  def set_front_page_content
    if I18n.locale == :fr
      @front_page_content = FrFrontPageContent.first
    else
      if I18n.locale == :en
        @front_page_content = EnFrontPageContent.first
      end
    end
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:profile_id, :avatar, :first_name, :last_name, :mobile_number, :phone_number, :identity_card_id, :address, :email, :password, :password_confirmation) }

      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :mobile_number, :identity_card_id, :address, :password, :password_confirmation, :current_password, :avatar) }
    end

end
