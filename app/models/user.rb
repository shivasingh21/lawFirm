class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_validation { self.email = self.email.downcase }

  validates :username, presence: true, length: { maximum: 25 }, uniqueness: { case_sensetive: false }
  validates :email, presence: true, length: { maximum: 40 }, uniqueness: { case_sensetive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password,presence: true

  has_many :clients, dependent: :destroy

end
