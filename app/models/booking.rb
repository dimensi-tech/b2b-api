# frozen_string_literal: true

class Booking < ApplicationRecord
  extend Enumerize
  belongs_to :customer, optional: :true
  belongs_to :package, optional: :true
  belongs_to :voucher, optional: :true

  has_many :payment_activities
  enumerize :status, in: { ordered: 0, paid: 1, error: 2 }
  enumerize :booking_status, in: { booked: 1, modified: 2, cancelled: 3 }

  after_create :assign_number

  def assign_number
    self.number = Time.now.to_i
    save
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
end
