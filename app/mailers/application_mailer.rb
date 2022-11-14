# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'nimue_ede@hotmail.com'
  layout 'mailer'
end
