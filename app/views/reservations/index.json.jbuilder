json.array!(@reservations) do |reservation|
  json.extract! reservation, :parlo_id, :employee_id, :status, :date_reservation, :start_time, :end_time
  json.url reservation_url(reservation, format: :json)
end
