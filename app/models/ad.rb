class Ad < ApplicationRecord
  mount_uploader :image, ImageUploader
end
