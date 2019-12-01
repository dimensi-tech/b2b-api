class Product < ApplicationRecord
  has_many :packages
  mount_uploader :image, ImageUploader
  has_many :package_details, through: :packages

  def image_path
    "#{ENV['HOST']}#{image_url}"
  end
end
