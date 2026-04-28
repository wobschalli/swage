json.extract! person, :id, :name, :location_id, :username, :grad_year, :discord_id, :created_at, :updated_at
json.url person_url(person, format: :json)
