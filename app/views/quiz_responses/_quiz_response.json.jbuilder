json.extract! quiz_response, :id, :quiz_id, :user_id, :selected_option_id, :created_at, :updated_at
json.url quiz_response_url(quiz_response, format: :json)
