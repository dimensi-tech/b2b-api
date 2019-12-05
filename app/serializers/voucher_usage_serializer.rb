class VoucherUsageSerializer < ActiveModel::Serializer
  attributes :voucher_id, :customer_id

  belongs_to :voucher
  belongs_to :customer
end
