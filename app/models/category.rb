class Category < ApplicationRecord
  has_many :colleges, through: :school_categories
  has_many :reviews
end
