class AdSerializer < ActiveModel::Serializer
  attributes :id, :status, :name, :image_path

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
