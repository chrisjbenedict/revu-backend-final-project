class User < ApplicationRecord
  has_secure_password

  has_many :reviews, dependent: :destroy
  has_many :colleges, through: :reviews

  validates :username, uniqueness: true



end
