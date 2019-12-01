class ProductDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_path

  has_many :packages
  has_many :package_details, through: :packages

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
