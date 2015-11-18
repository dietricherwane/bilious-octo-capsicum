class UsersController < ApplicationController

  prepend_before_filter :authenticate_user!

  before_filter :init_admin_data, only: [:list_administrator_accounts, :disable_administrator_account, :enable_administrator_account, :display_administrator_profile]
  before_filter :sign_out_disabled_users

  layout :select_layout

  def list_administrator_accounts
    profile = current_user.profile

    case profile.shortcut
      when "AUD"
        @users = User.where(profile_id: Profile.where(shortcut: ["AUD"]).map{|p| p.id})
      when "ADM"
        @users = User.where(profile_id: Profile.where(shortcut: ["ADM", "AUD"]).map{|p| p.id})
      when "S-ADM"
        @users = User.all
      end
  end

  def disable_administrator_account
    user = User.find_by_id(params[:user_id])

    if user
      if can_disable(user)
        flash[:success] = "Le compte de #{user.full_name} a été désactivé."
        user.update_attributes(published: false, unpublished_by: current_user.id, unpublished_at: DateTime.now)
      else
        flash[:error] = "Vous n'êtes pas autorisé à désactiver ce compte."
      end
    else
      flash[:error] = "Cet utilisateur n'existe pas."
    end

    redirect_to list_administrators_path
  end

  def enable_administrator_account
    user = User.find_by_id(params[:user_id])

    if user
      if can_disable(user)
        flash[:success] = "Le compte de #{user.full_name} a été activé."
        user.update_attributes(published: true, published_by: current_user.id, published_at: DateTime.now)
      else
        flash[:error] = "Vous n'êtes pas autorisé à activer ce compte."
      end
    else
      flash[:error] = "Cet utilisateur n'existe pas."
    end

    redirect_to list_administrators_path
  end

  def display_administrator_profile
    @user = User.find_by_id(params[:user_id])

    if @user.blank?
      flash[:error] = "Cet utilisateur n'existe pas."
      redirect_to list_administrators_path
    else
      if !can_display_profile
        flash[:error] = "Vous n'êtes pas autorisé à afficher ce profil."
        redirect_to list_administrators_path
      end
    end
  end

  private
    def init_interface_data
      @class_dashboard = "active"
    end

    def can_disable(user)
      current_user_profile = current_user.profile
      user_profile = user.profile
      status = false

      if current_user_profile.shortcut == "S-ADM" && user_profile.shortcut != "S-ADM"
        status = true
      end

      if current_user_profile.shortcut == "ADM" && user_profile.shortcut != "S-ADM" && user_profile.shortcut != "ADM"
        status = true
      end

      return status
    end

    def can_display_profile
      current_user_profile = current_user.profile
      user_profile = @user.profile
      status = false

      if current_user_profile.shortcut == "S-ADM"
        status = true
      end

      if current_user_profile.shortcut == "ADM" && user_profile.shortcut != "S-ADM"
        status = true
      end

      if current_user_profile.shortcut == "AUD" && user_profile.shortcut != "S-ADM" && user_profile.shortcut != "ADM"
        status = true
      end

      return status
    end

    def init_admin_data
      @class_dashboard = "active"
    end

end
