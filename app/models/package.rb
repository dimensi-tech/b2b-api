class Package < ApplicationRecord
  belongs_to :product
  belongs_to :discount

  has_many :facilities
  has_many :package_details
  has_many :saving_packages
end
