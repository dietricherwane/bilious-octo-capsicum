module CompaniesHelper

  def company_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| (msg + "<br />") }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      <div class="alert alert-warning alert-dismissable job-alert alert-red">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
				#{messages}
			</div>
    HTML

    html.html_safe
  end

end
