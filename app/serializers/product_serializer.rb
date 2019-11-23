class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :package

  def package
    object.packages.order(price: :asc).last
  end
end
