json.extract! lesson, :id, :title, :video_url, :course_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
