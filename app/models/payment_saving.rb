# frozen_string_literal: true

class PaymentSaving < ApplicationRecord
  extend Enumerize
  belongs_to :booking
  enumerize :status, in: { unpaid: 1, paid: 2 }
end
