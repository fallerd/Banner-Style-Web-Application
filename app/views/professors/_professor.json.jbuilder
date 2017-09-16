json.extract! professor, :id, :professor_name, :email_address, :office_location, :created_at, :updated_at
json.url professor_url(professor, format: :json)
