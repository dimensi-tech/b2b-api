class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :package, :image_path

  belongs_to :category
  belongs_to :travel_destination

  def package
    object.packages.order(price: :asc).last
  end

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
