class NotificationMailer < ApplicationMailer

  default from: "shiva297912singh@gmail.com"

  def notification_mailer( client )

    @client = client
    mail( to: @client.email, subject: "LawFirm Rails Project Notification Mail" )
  end

end
