json.extract! course, :id, :course_name, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
