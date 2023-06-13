class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_secure_password
  has_many :articles
end
