# frozen_string_literal: true

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :package, :image_path, :travel_destination, :travel_partner_id

  belongs_to :category
  belongs_to :travel_destination
  belongs_to :travel_partner

  def package
    object.packages.order(price: :asc).last
  end

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
