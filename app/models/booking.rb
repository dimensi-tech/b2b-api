# frozen_string_literal: true

class Booking < ApplicationRecord
  extend Enumerize
  belongs_to :customer, optional: true
  belongs_to :package, optional: true
  belongs_to :voucher, optional: true
  belongs_to :saving_package, optional: true

  has_many :payment_activities
  has_many :payment_savings

  enumerize :booking_type, in: { full: 1, savings: 2 }
  enumerize :status, in: { ordered: 0, paid: 1, error: 2 }
  enumerize :booking_status, in: { booked: 1, modified: 2, cancelled: 3 }

  after_create :assign_number

  def assign_number
    self.number = Time.now.to_i
    save
  end

  def create_savings(identity_id)
    return if PaymentSaving.where(identity_id: identity_id, booking_id: id).present?

    total_months = saving_package.sort
    index = 0
    total_months.times do
      index += 1
      PaymentSaving.create(
        booking_id: id, amount: saving_package.adult_amount,
        identity_id: identity_id, payment_for: index,
        status: 1, saving_type: 'adult'
      )
    end
  end

  def create_child_savings(callback_id)
    return if PaymentSaving.where(passport_id: callback_id, booking_id: id).present?

    total_months = saving_package.sort
    index = 0
    total_months.times do
      index += 1
      PaymentSaving.create(
        booking_id: id, amount: saving_package.child_amount,
        passport_id: callback_id, payment_for: index,
        status: 1, saving_type: 'child'
      )
    end
  end

  def generate_payment_code
    code = nil

    loop do
      code = 'BOOKING/' + SecureRandom.hex(16 / 4).upcase + id.to_s +
             DateTime.now.strftime('/%d%m%Y').to_s
      break unless PaymentActivity.exists?(order_id: code)
    end

    update(payment_code: code)
  end

  def calculate_total_booking
    total_adult_price = adult * package.adult_price
    total_child_price = child * package.child_price
    total_adult_price + total_child_price
  end
end
