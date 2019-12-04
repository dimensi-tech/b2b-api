class PackageSerializer < ActiveModel::Serializer
  attributes :id, :discount_percentage, :product_id, :discount_id, :discount_price,
             :down_payment, :duration_trip, :available_date, :normal_price

  belongs_to :product
  belongs_to :discount
  has_many :package_details

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
end
