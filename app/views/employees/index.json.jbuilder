json.array!(@employees) do |employee|
  json.extract! employee, :name, :lastname, :company_id, :country_id, :photo
  json.url employee_url(employee, format: :json)
end
