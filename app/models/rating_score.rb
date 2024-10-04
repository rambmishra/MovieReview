class RatingScore < ApplicationRecord
  belongs_to :rating
  belongs_to :rating_category

  validates :score, presence: true, inclusion: { in: 1..5 }
end
