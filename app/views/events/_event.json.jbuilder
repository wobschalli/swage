json.extract! event, :id, :name, :location_id, :start, :end, :created_at, :updated_at
json.url event_url(event, format: :json)
