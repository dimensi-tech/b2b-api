class VoucherSerializer < ActiveModel::Serializer
  attributes :code, :name, :start_date, :end_date, :percentage, :max_amount,
  :max_usage, :status
end
