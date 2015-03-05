class HighSchool < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true, uniqueness: true
end
