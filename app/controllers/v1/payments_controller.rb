module V1
  class PaymentsController < ApplicationController
    before_action :set_booking, only: %i[veritrans_token]

    def veritrans_token
      @snap_token   = Payments::VeritransTokenService.new(
        booking: @booking,
        status: params[:status]
      ).generate

      render json: { token: @snap_token }
    end

    private

    def set_booking
      @booking = Booking.find_by(id: params[:booking_id])
    end
  end
end
