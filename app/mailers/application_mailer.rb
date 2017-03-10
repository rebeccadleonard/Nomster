class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@nomster.com'
  layout 'mailer'
end
