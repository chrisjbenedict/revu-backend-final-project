class SchoolCategory < ApplicationRecord
  belongs_to :school
  belongs_to :category
end
