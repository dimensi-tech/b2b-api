class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :travel_destination
  belongs_to :travel_partner
  has_many :packages
  has_many :package_details, through: :packages

  def image_path
    "#{ENV['HOST']}#{image_url}"
  end
end
