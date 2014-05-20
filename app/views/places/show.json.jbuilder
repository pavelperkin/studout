json.extract! @place, :id, :title, :discount, :discount_description, :latitude, :longitude, :address
json.description @place.description.empty? ? nil : @place.description
json.discount_description @place.discount_description.empty? ? nil : @place.discount_description
json.city @place.city.name
json.pictures @place.pictures.map {|p| p.image.current_path}
