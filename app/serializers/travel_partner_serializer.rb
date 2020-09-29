# frozen_string_literal: true

class TravelPartnerSerializer < ActiveModel::Serializer
  attributes :name, :logo, :address, :description
end
