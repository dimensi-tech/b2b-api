class Product < ApplicationRecord
  has_many :packages
  mount_uploader :image, ImageUploader
  has_many :package_details, through: :packages
end
