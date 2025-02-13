json.extract! quiz_option, :id, :quiz_id, :content, :correct, :created_at, :updated_at
json.url quiz_option_url(quiz_option, format: :json)
