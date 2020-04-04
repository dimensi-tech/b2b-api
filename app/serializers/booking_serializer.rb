class BookingSerializer < ActiveModel::Serializer
  attributes :id, :departure_date, :package_id, :voucher_id, :price, :status,
             :number, :customer_id, :identity_ids, :person, :midtrans_id,
             :product, :passport_ids

  belongs_to :package
  belongs_to :voucher
  belongs_to :customer

  def product
    object.package.product
  end
end
