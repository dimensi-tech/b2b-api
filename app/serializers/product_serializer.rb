class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :package, :image_url

  def package
    object.packages.order(price: :asc).last
  end
end
