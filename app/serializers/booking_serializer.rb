class BookingSerializer < ActiveModel::Serializer
  attributes :id, :departure_date, :package_id, :voucher_id, :price,
             :number, :customer_id, :identity_ids, :person

  belongs_to :package
  belongs_to :voucher
end
