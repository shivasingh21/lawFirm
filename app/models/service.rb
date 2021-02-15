class Service < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :clients
end
