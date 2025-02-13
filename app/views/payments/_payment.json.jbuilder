json.extract! payment, :id, :user_id, :course_id, :amount, :status, :created_at, :updated_at
json.url payment_url(payment, format: :json)
