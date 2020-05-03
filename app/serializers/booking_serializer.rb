class BookingSerializer < ActiveModel::Serializer
  attributes :id, :departure_date, :package_id, :voucher_id, :price, :status, :adult_bio_ids, :child_bio_ids,
             :number, :customer_id, :identity_ids, :person, :midtrans_id, :child_passport_ids,
             :product, :passport_ids, :booking_status, :booking_type, :adult, :child

  belongs_to :package
  belongs_to :voucher
  belongs_to :customer

  def product
    object.package.product
  end
end
