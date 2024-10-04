class Movie < ApplicationRecord
  has_many :ratings
  has_many :rating_scores, through: :ratings

  def average_scores_per_category
    rating_scores
      .joins(:rating_category)
      .group('rating_categories.name')
      .average(:score)
      .transform_values { |avg| avg.round(2).to_s }
  end

  def overall_average_score
    avg = rating_scores.average(:score)
    avg.present? ? avg.round(2).to_s : '0.0'
  end
end
