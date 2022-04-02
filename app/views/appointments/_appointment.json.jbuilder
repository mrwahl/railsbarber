json.extract! appointment, :id, :barber, :customer, :notes, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
