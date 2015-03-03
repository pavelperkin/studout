class HighSchool < ActiveRecord::Base
  validates :name, presence: true
end
