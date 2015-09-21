class ApplicationMailer < ActionMailer::Base
  default from: "admin@ticketee.com"
  layout 'mailer'
end
