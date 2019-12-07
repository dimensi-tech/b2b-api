class PackageDetail < ApplicationRecord
  belongs_to :package
  mount_uploader :image, ImageUploader
end
