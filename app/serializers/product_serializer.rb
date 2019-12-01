class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :package, :image_path

  def package
    object.packages.order(price: :asc).last
  end

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
