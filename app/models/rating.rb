class Rating < ApplicationRecord
  belongs_to :movie
  has_many :rating_scores, dependent: :destroy

  accepts_nested_attributes_for :rating_scores, allow_destroy: true
end
