json.array!(@parlos) do |parlo|
  json.extract! parlo, :name_parlo, :status, :country_id
  json.url parlo_url(parlo, format: :json)
end
