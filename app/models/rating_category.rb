class RatingCategory < ApplicationRecord
  has_many :rating_scores, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
