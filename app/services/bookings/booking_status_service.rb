module Bookings
  class BookingStatusService
    def initialize(status:, customer:, booking:)
      @status             = status
      @customer           = customer
      @booking            = booking
      @availalbe_statuses = ['paid', 'modified', 'cancelled', 'down_payment', 'saving_progress', 'completed']
    end

    def call
      if @status == 'pending'
        ConfirmationJob.perform_later('booking', @customer.id, @booking.id)
      elsif @availalbe_statuses.include?(@status)
        BookingStatusJob.perform_later(@status, @customer.id, @booking.id)
      end
    end
  end
end
