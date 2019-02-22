class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :schools, through: :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
