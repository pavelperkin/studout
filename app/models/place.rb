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
    response = HTTParty.get(URI.encode("http://geocode-maps.yandex.ru/1.x/?geocode=#{get_address}&format=json"))
    self.longitude, self.latitude = response["response"]["GeoObjectCollection"]["featureMember"]
                                      .first["GeoObject"]["Point"]["pos"].split
  end


  def get_address
    [self.city.country.name,
     self.city.name,
     self.address.split.join(",")].join(",")
  end

end
