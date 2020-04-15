# frozen_string_literal: true

module V1
  class PaymentSavingsController < ApplicationController

    def create_payment_saving
      @payment_saving = PaymentSaving.new(payment_saving_params)

      if @payment_saving.save
        render json: @payment_saving, serializer: PaymentSavingSerializer
      else
        puts @payment_saving.errors
        render json: { success: false, message: 'Error Create Payment Saving' }
      end
    end

    private

    def payment_saving_params
      params.require(:payment_saving).permit(:booking_id, :payment_for, :amount)
    end
  end
end
