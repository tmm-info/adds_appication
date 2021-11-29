json.extract! user, :id, :username, :login, :full_name, :birthday, :email, :address, :city, :state, :country, :zip, :role_id, :created_at, :updated_at
json.url user_url(user, format: :json)
