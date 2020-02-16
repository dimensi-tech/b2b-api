class BookingSerializer < ActiveModel::Serializer
  attributes :id, :departure_date, :package_id, :voucher_id, :price,
             :number, :customer_id, :identity_ids, :person, :product, :midtrans_id

  belongs_to :package
  belongs_to :voucher
  belongs_to :customer

  def product
    object.package.product
  end
end
