json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :latitude, :longitude, :created_at
  json.high_school comment.high_school.name
end
