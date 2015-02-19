json.array!(@places) do |place|
  json.extract! place, :id, :title, :latitude, :longitude, :city, :address, :discount
  json.city place.city.name
  json.category place.category.name
  json.picture place.avatar_url
  json.url place_url(place, format: :json)
end
