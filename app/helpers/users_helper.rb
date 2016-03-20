module UsersHelper

  def activation_desactivation_links(current_user_profile_shortcut, current_user_id, user)
    if user.published == false
      html = <<-HTML
        <a href="#{enable_administrator_account_path(user.id)}" class="tipS" original-title="Activer le compte">#{image_tag('icons/color/tick.png', alt: '')}</a>
      HTML
    else
      html = <<-HTML
        <a href="#{disable_administrator_account_path(user.id)}" class="tipS" original-title="Désactiver le compte">#{image_tag('icons/color/cross.png', alt: '')}</a>
      HTML
    end

    if current_user_profile_shortcut == "S-ADM" && user.profile.shortcut == "S-ADM"
      html = ""
    else
      if current_user_profile_shortcut == "ADM" && (user.profile.shortcut == "S-ADM" || user.profile.shortcut == "ADM")
        html = ""
      else
        if current_user_profile_shortcut == "AUD" && html == ""

        end
      end
    end

    # Only allow a user to edit his own profile
    if current_user_id == user.id
      html << %Q[<a href="/#{I18n.locale}/users/edit.#{current_user.id}" class="tipS" original-title="Modifier le profil">#{image_tag('icons/color/pencil.png', alt: '')}</a>]
    end


    html.html_safe
  end

end
