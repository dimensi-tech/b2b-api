class PackageDetailSerializer < ActiveModel::Serializer
  attributes :id, :package_id, :day, :description, :image_path

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
