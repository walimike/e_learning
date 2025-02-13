json.extract! rating, :id, :course_id, :user_id, :stars, :review, :created_at, :updated_at
json.url rating_url(rating, format: :json)
