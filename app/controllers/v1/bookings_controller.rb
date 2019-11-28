module V1
  class BookingsController < ApplicationController
    def create_booking
      @booking = Booking.new(booking_params)

      if @booking.save
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Create booking' }
      end
    end

    private

    def booking_params
      params.require(:booking)
            .permit(:departure_date, :package_id, :child, :adult, :customer_id)
    end
  end
end
