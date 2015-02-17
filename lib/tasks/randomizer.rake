task randomizer: :environment  do
  Place.all.group_by(&:address).map {|p| p.last}.select {|p| p.count > 1}.each do |places|
    randomize(places)
  end
end

def randomize places
  origin = places.shift
  places.each_with_index do |pl, index|
    pl.latitude += (index+1)* 0.0001
    pl.save
  end
end
