# frozen_string_literal: true

module V1
  class BookingsController < ApplicationController
    before_action :set_booking, only: %i[assign_identities assign_passports
                                         booking_detail update_midtrans assign_child_passports
                                         modify_booking cancel_booking]

    def create_booking
      @booking = Booking.new(booking_params)
      @booking.customer_id = @current_customer.id

      if @booking.save
        @booking.generate_payment_code
        render json: @booking, serializer: BookingSerializer
      else
        puts @booking.errors
        render json: { success: false, message: 'Error Create booking' }
      end
    end

    def modify_booking
      if @booking.present? && @booking.update(booking_params)
        @booking.update(booking_status: 2)
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Modify Booking' }
      end
    end

    def cancel_booking
      if @booking.present?
        @booking.update(booking_status: 3)
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error to Canceling Booking' }
      end
    end

    def assign_identities
      if @booking.present? && @booking.update(identities_params)
        identities_params[:identity_ids].each_with_index do |index, _identity|
          @booking.create_savings(index) if @booking.saving_package.present?
        end
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Assign Identity Ids' }
      end
    end

    def savings_customer
      @savings = PaymentSaving.where(
        booking_id: params[:booking_id],
        identity_id: params[:identity_id]
      )
      if @savings.present?
        render json: @savings.order(payment_for: :asc)
      else
        render json: { success: false, message: 'Cannot Find Savings' }
      end
    end

    def assign_passports
      if @booking.present? && @booking.update(passports_params)
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Assign Identity Ids' }
      end
    end

    def assign_child_passports
      if @booking.present? && @booking.update(child_passports_params)
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Error Assign Identity Ids' }
      end
    end

    def list_bookings
      @bookings = Booking.where(customer_id: @current_customer.id)

      if @bookings.present?
        render json: @bookings
      else
        render json: { success: false, message: 'Error Assign Identity Ids' }
      end
    end

    def booking_detail
      @booking = Booking.where(customer_id: @current_customer.id,
                               id: params[:booking_id]).last
      if @booking.present?
        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Cannot find booking Id' }
      end
    end

    def update_midtrans
      if @booking.present? && @booking.update(midtrans_id: params[:midtrans_id],
                                              status: params[:status])

        render json: @booking, serializer: BookingSerializer
      else
        render json: { success: false, message: 'Midtrans failed to update' }
      end
    end

    def list_paid_bookings
      @bookings = Booking.where(customer_id: @current_customer.id, status: 1)
      if @bookings.present?
        render json: @bookings
      else
        render json: { success: false, message: 'Paid booking not available' }
      end
    end

    def saving_paid
      @saving = PaymentSaving.find_by(id: params[:id])

      if @saving.present?
        @saving.update(status: 2)
        render json: @saving, serializer: PaymentSavingSerializer
      else
        render json: { success: false, message: 'Paid Saving  Failed' }
      end
    end

    def saving_midtrans
      @saving = PaymentSaving.find_by(id: params[:id])

      if @saving.present? && @saving.update(midtrans_id: params[:midtrans_id])
        render json: @saving, serializer: PaymentSavingSerializer
      else
        render json: { success: false, message: 'Paid Saving  Failed' }
      end
    end

    private

    def set_booking
      @booking = Booking.find_by(id: params[:booking_id])
    end

    def booking_params
      params.require(:booking)
            .permit(:departure_date, :package_id, :voucher_id, :person, :price,
                    :midtrans_id, :booking_type, :saving_package_id, :customer_id, :adult, :child,
                    identity_ids: [], passport_ids: [])
    end

    def identities_params
      params.require(:booking).permit(identity_ids: [])
    end

    def passports_params
      params.require(:booking).permit(passport_ids: [])
    end

    def child_passports_params
      params.require(:booking).permit(child_passport_ids: [])
    end
  end
end
