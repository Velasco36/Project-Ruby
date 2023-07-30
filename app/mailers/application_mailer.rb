class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  default from: "no-reply@vendelo.com"
  layout "mailer"
end
