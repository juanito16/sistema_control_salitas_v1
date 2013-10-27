json.array!(@admins) do |admin|
  json.extract! admin, :name, :lastname, :type, :country_id
  json.url admin_url(admin, format: :json)
end
