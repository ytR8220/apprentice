class User < ApplicationRecord
  validates :username, :email, :password , presence: true
  has_secure_password
  has_many :articles
  dipendent: :destroy
end
