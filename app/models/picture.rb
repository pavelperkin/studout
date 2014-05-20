class Picture < ActiveRecord::Base
  belongs_to :place
  mount_uploader :image, ImageUploader
end
