json.extract! rating, :id, :rating_category_id, :movie_id, :created_at, :updated_at
json.url rating_url(rating, format: :json)
