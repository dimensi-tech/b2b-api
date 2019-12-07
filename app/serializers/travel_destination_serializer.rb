# frozen_string_literal: true

class TravelDestinationSerializer < ActiveModel::Serializer
  attributes :country_id, :destination, :image_path

  belongs_to :country
  has_many :products

  def image_path
    "#{ENV['HOST']}#{object.image.url}"
  end
end
