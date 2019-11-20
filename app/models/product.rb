class Product < ApplicationRecord
  has_many :packages
  has_many :package_details, through: :packages
end
