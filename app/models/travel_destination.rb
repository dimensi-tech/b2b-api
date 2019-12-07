class TravelDestination < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :country
  has_many :products
end
