class Category < ApplicationRecord
  has_many :schools, through: :school_categories
  has_many :reviews 
end
