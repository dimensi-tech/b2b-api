class PaymentSavingSerializer < ActiveModel::Serializer
  attributes :id, :booking_id, :payment_for, :amount, :status, :midtrans_id,
             :saving_type, :identity_id, :passport_id

  belongs_to :booking
end
