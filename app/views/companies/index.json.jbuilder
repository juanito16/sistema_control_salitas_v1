json.array!(@companies) do |company|
  json.extract! company, :name, :country_id
  json.url company_url(company, format: :json)
end
