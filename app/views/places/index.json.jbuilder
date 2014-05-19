json.array!(@places) do |place|
  json.extract! place, :id, :title, :description, :discount, :latitude, :longitude, :city_id, :address
  json.url place_url(place, format: :json)
end
