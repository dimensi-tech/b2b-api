class BookingSerializer < ActiveModel::Serializer
  attributes :id, :departure_date, :package_id, :child, :adult,
             :number, :customer_id, :identity_ids

  belongs_to :package
end
