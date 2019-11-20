class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :packages
  has_many :package_details, through: :packages
end
