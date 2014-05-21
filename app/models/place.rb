class Place < ActiveRecord::Base
  belongs_to :city
  belongs_to :category
  has_many :pictures

  validates :city_id,  presence: true
  validates :address,  presence: true
  validates :title,    presence: true

  before_save :set_lat_and_lng

  private

  def set_lat_and_lng
    response = HTTParty.get(URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{get_address}&sensor=_false"))
    coordinates = response["results"].first["geometry"]["location"]
    self.latitude = coordinates["lat"]
    self.longitude = coordinates["lng"]
  end


  def get_address
    [self.address.split.join("+"), self.city.name, self.city.country.name].join(",")
  end

end
