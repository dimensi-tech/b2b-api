class Booking < ApplicationRecord
  belongs_to :customer, optional: :true
  belongs_to :package, optional: :true
  belongs_to :voucher, optional: :true

  after_create :assign_number

  def assign_number
    self.number = Time.now.to_i
    save
  end
end
