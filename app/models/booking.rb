class Booking < ApplicationRecord
  belongs_to :customer, optional: :true
  belongs_to :package, optional: :true
  belongs_to :voucher, optional: :true

  has_many :payment_activities
  
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
