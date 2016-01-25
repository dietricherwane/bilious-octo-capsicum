module HomeHelper
  def front_messages!
    [:notice, :error, :success, :alert].each do |key|
      if flash[key]
        @key = key
        @message = flash[key]
      end
    end

    return "" if @message.blank?

    html = <<-HTML
      <div class="">
        <p><strong>#{@message}</strong></p>
      </div>
    HTML

    html.html_safe
  end
end
