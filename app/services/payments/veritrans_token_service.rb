module Payments
  class VeritransTokenService
    def initialize(booking:, status:)
      @booking = booking
      @status  = status
    end

    def generate
      request_token.token
    end

    private

    def request_token
      Veritrans.create_widget_token(
        transaction_details: {
          order_id: check_request_status,
          gross_amount: @booking.package.down_payment.to_i
        },
        expiry: {
          start_time: DateTime.now.strftime('%Y-%m-%d %H:%M:%S %z'),
          unit: 'day',
          duration: 1
        },
        custom_field1: @booking.id.to_s
      )
    end

    def check_request_status
      @booking.generate_payment_code if @status == 'repayment'
      @booking.payment_code
    end
  end
end
