class Package < ApplicationRecord
  belongs_to :product
  has_many :package_details
  has_many :facilities
end
