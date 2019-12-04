class Package < ApplicationRecord
  belongs_to :product
  belongs_to :discount
  has_many :package_details
  has_many :facilities
end
