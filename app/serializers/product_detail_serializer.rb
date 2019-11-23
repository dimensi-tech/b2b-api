class ProductDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image

  has_many :packages
  has_many :package_details, through: :packages
  
end
