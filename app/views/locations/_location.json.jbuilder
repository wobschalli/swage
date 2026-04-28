json.extract! location, :id, :name, :aliases, :lon, :lat, :created_at, :updated_at
json.url location_url(location, format: :json)
