json.extract! student, :id, :name, :student_number, :email_address, :created_at, :updated_at
json.url student_url(student, format: :json)
