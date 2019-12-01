class ProductDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url

  has_many :packages
  has_many :package_details, through: :packages

  def image_url
    object.image.url
  end
end
