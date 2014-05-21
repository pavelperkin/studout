json.array!(@places) do |place|
  json.extract! place, :id, :title, :latitude, :longitude, :city, :address
  json.city place.city.name
  json.category place.category.name
  json.picture place.pictures.first.try(:image_url)
  json.url place_url(place, format: :json)
end
