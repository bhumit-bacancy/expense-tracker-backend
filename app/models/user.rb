class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :expenses
  has_secure_password
end