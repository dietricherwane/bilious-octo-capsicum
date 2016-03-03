class Notifier < ActionMailer::Base
  default from: "mailler@competencesfeminines.gouv.ci"

  def contact_email(name, email, subject, content)
    @name = name
    @email = email
    @subject = subject
    @content = content

    mail(to: "dietricherwane@live.com", subject: "Prise de contact")
  end
end
