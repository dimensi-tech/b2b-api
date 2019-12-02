# frozen_string_literal: true

module V1
  class BookingsController < ApplicationController
    before_action :set_booking, only: %i[assign_identities]
    def create_booking
      @booking = Booking.new(booking_params)

      if @booking.save
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Create booking' }
      end
    end

    def assign_identities
      if @booking.present? && @booking.update(identities_params)
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Assign Identity Ids' }
      end
    end

    def list_bookings
      @booking = Booking.find_by(customer_id: params[:customer_id])

      if @booking.present?
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Assign Identity Ids' }
      end
    end

    private

    def set_booking
      @booking = Booking.find_by(id: params[:booking_id])
    end

    def booking_params
      params.require(:booking)
            .permit(:departure_date, :package_id, :child,
                    :adult, :customer_id, identity_ids: [])
    end

    def identities_params
      params.require(:booking).permit(identity_ids: [])
    end
  end
end
