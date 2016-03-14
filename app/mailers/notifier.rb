class Notifier < ActionMailer::Base
  default from: "mailler@competencesfeminines.gouv.ci"

  def contact_email(name, email, subject, content)
    @name = name
    @email = email
    @subject = subject
    @content = content

    mail(to: ["info@competencesfeminines.gouv.ci", "info@chaireunesco-efpod.org"], subject: "Prise de contact")
  end
end
