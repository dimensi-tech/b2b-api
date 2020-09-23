# frozen_string_literal: true

class PackageSerializer < ActiveModel::Serializer
  attributes :id, :discount_percentage, :product_id, :discount_id, :discount_price,
             :min_adult, :max_adult, :down_payment, :duration_trip, :available_date,
             :normal_price, :name, :description, :booking_options, :min_child, :max_child,
             :adult_price, :child_price, :is_saving, :down_payment_type, :down_payment_flat,
             :down_payment_percentage

  belongs_to :product
  belongs_to :discount

  has_many :package_details
  has_many :saving_packages

  def discount_percentage
    object.discount.percentage if object.discount.present?
  end

  def discount_price
    if object.discount.present?
      discount_amount = object.price * (object.discount.percentage / 100)
      object.price -= discount_amount
    end
  end

  def normal_price
    Package.find(object.id).price
  end

  def booking_options
    if object.saving_packages.present?
      [1, 2]
    else
      [1]
    end
  end
end
