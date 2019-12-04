class ProductDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_path, :packages

  # has_many :packages
  belongs_to :category
  belongs_to :travel_destination

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end

  def packages
    object.packages.map do |package|
      PackageSerializer.new(package, scope: scope, root: false, event: object)
    end
  end
end
