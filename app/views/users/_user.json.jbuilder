json.extract! user, :id, :email, :email_confirmed, :confirm_token, :username, :password_digest, :title, :major, :officer, :created_at, :updated_at
json.url user_url(user, format: :json)
