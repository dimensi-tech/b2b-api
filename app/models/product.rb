class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category
  belongs_to :travel_destination

  has_many :packages
  has_many :package_details, through: :packages

  scope :available_packages, -> { joins(:packages).where('packages.available_date && ?', "{#{Time.now.strftime('%d/%m/%Y')}}") }

  def image_path
    "#{ENV['HOST']}#{image_url}"
  end
end
