class BookingStatusJob < ApplicationJob
  queue_as 'b2b-api-booking-status'

  def perform(status, customer_id, booking_id)
    BookingStatusMailer.send(status, customer_id, booking_id).deliver
  end
end
