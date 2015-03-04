class Comment < ActiveRecord::Base
  belongs_to :high_school

  validates :body, :high_school_id, :latitude, :longitude, presence: true

  validates :high_school_id, numericality: { greater_than: 0 } 
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

end
