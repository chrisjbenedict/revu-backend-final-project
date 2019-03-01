class College < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  has_many :users, through: :favorites
  has_many :categories, through: :school_categories
end
