class EmailTemplate < ApplicationRecord
  extend Enumerize
  mount_uploader :attachment_file, ImageUploader

  scope :active, -> { where(status: true) }

  enumerize :template_type, in: %i[
    payment_paid email_confirmation booking_confirmation booking_modified booking_cancelled
    down_payment savings_progress booking_completed
  ], scope: :type
end
