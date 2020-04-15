class PaymentSavingSerializer < ActiveModel::Serializer
  attributes :id, :booking_id, :payment_for, :amount

  belongs_to :booking
end
