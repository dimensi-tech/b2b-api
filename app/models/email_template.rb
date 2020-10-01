class EmailTemplate < ApplicationRecord
  extend Enumerize
  mount_uploader :attachment_file, ImageUploader

  scope :active, -> { where(status: true) }

  enumerize :template_type, in: %i[payment_finish email_confirmation booking_confirmation], scope: :type
end
