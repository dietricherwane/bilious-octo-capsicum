module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "nNote nInformation hideit"
    when :success then "nNote nSuccess hideit"
    when :error then "nNote nFailure hideit"
    when :alert then "nNote nWarning hideit"
    end
  end

  def flash_messages!
    [:notice, :error, :success, :alert].each do |key|
      if flash[key]
        @key = key
        @message = flash[key]
      end
    end

    return "" if @message.blank?

    html = <<-HTML
      <div class="#{flash_class(@key)}">
        <p><strong>#{@message}</strong></p>
      </div>
    HTML

    html.html_safe
  end

  def go_back()
    link_to('<span>Revenir en arrière</span>'.html_safe, 'javascript:history.go(-1);', class: 'button redB')
  end

  def visitors_online
    return (Visit.where("started_at + interval '4 hour' > '#{DateTime.now}'").count.to_s rescue "")
  end

  def visitors_all_days
    return (Visit.all.count.to_s rescue "")
  end

  def front_language_menu
    if I18n.locale == :fr
      html = <<-HTML
        <img src="#{asset_path 'front/imgs/FR-Flag.ico'}" alt="" width="22px" />#{@front_page_content.home_toolbar_language_fr}</span>
      HTML
    else
      html = <<-HTML
        <img src="#{asset_path 'front/imgs/uk_flag.png'}" alt="" />#{@front_page_content.home_toolbar_language_en}</span>
      HTML
    end

    html.html_safe
  end

end
