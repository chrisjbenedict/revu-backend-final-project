class Review < ApplicationRecord
  belongs_to :school
  belongs_to :user
  belongs_to :category

  validates :content, presence: true
  validates :rating, presence: true

  validate :rating_is_1_to_5

  def rating_is_1_to_5
    if !self.rating || self.rating < 0 || self.rating > 5
      errors.add(:rating, "must be between 1 and 5")
    end
  end

end
