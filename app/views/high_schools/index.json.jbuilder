json.array!(@high_schools) do |high_school|
  json.extract! high_school, :id, :name
end
