class Client < ApplicationRecord
  belongs_to :user
 has_and_belongs_to_many :services
  validates :phone_number, presence: true, numericality: true, length: { is: 9 }

  def self.send_mail
    NotificationMailer.notification_mailer( @client ).deliver
  end
end
