class College < ApplicationRecord
  has_many :reviews
  has_many :students, through: :reviews
  has_many :categories, through: :school_categories
end
