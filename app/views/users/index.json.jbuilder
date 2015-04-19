json.array!(@users) do |user|
  json.extract! user, :id, :email, :pseudo, :desc, :age, :avatar_name, :last_name, :first_name, :pwd, :isAdmin
  json.url user_url(user, format: :json)
end
