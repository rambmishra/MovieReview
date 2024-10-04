class RatingsController < ApplicationController
  before_action :set_movie

  # GET /movies/:movie_id/ratings
  def index
    @ratings = @movie.ratings.includes(rating_scores: :rating_category)
  end

  # GET /movies/:movie_id/ratings/new
  def new
    @rating = @movie.ratings.new

    RatingCategory.all.each do |category|
      @rating.rating_scores.build(rating_category: category)
    end
  end

  # POST /movies/:movie_id/ratings
  def create
    @rating = @movie.ratings.new(rating_params)
    @rating.save

    redirect_to movie_ratings_path(@movie), notice: 'Rating was successfully created.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_rating
    @rating = @movie.ratings.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rating_params
    params.require(:rating).permit(
      rating_scores_attributes: %i[id rating_category_id score _destroy]
    )
  end
end
