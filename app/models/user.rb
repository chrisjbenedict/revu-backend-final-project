class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :colleges, through: :reviews
  has_many :colleges, through: :favorites
  validates :username, uniqueness: true

end
