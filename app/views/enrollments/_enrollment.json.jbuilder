json.extract! enrollment, :id, :user_id, :course_id, :status, :progress, :paid, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)
