class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@fusebox-playbacks.herokuapp.com'
  layout 'mailer'
end
