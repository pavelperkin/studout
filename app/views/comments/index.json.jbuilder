json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :highschool_id, :latitude, :longitude
  json.url comment_url(comment, format: :json)
end
