class VoucherUsage < ApplicationRecord
  belongs_to :customer
  belongs_to :voucher

  validates :customer_id, :voucher_id, presence: true
  validate :max_usage_reached?, on: :create

  scope :current_usages, -> (customer_id, voucher_id) { where(customer_id: customer_id, voucher_id: voucher_id) }

  def max_usage_reached?
    if customer.present? && voucher.present?
      max_usage      = voucher.max_usage
      current_usages = VoucherUsage.current_usages(customer.id, voucher.id).count

      if current_usages >= max_usage
        errors.add(:voucher, "Voucher tidak bisa digunakan lebih dari #{max_usage} kali.")
      end
    else
      errors.add(:voucher, "Voucher atau Pelanggan tidak ditemukan.")
    end
  end
end
