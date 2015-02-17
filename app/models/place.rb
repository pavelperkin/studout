class Place < ActiveRecord::Base
  belongs_to :city
  belongs_to :category
  has_many :pictures

  validates :city_id,  presence: true
  validates :address,  presence: true
  validates :title,    presence: true

  before_create :set_lat_and_lng
  mount_uploader :avatar, ImageUploader

  private

  def set_lat_and_lng
    response = HTTParty.get(URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{get_address}&sensor=_false"))
    coordinates = response["results"].first["geometry"]["location"]
    self.latitude = coordinates["lat"]
    self.longitude = coordinates["lng"]
    one_address > 5 ? (self.longitude += (one_address - 4) * 0.0001) : (self.latitude += one_address * 0.0001)
  end

  def get_address
    [self.address.split.join("+"), self.city.name, self.city.country.name].join(",")
  end

  def one_address
    Place.where(address: address).count
  end

end
