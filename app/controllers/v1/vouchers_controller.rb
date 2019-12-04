module V1
  class VouchersController < ApplicationController
    before_action :set_voucher, only: %i[show create_voucher_usage]
    before_action :set_customer, only: %i[create_voucher_usage]

    def index
      @search   = Voucher.order(name: :asc).ransack(params[:q])
      @vouchers = @search.result(distinct: true)

      if @vouchers.present?
        render json: @vouchers
      else
        render json: { success: false, message: 'Voucher tidak tersedia.' }
      end
    end

    def show; end

    def create_voucher_usage
      @voucher_usage = VoucherUsage.new(voucher_usage_params)

      if @voucher_usage.save
        render json: {
          success: true,
          serializer: VoucherUsageSerializer,
          messages: "Voucher usage berhasil dibuat."
        }
      else
        render json: {
          success: false,
          messages: "Terjadi kesalahan, voucher usage gagal dibuat.",
          errors: @voucher_usage.errors.full_messages
        }
      end
    end

    private

    def set_voucher
      @voucher = Voucher.find(params[:voucher_id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def voucher_params
      params.require(:voucher).permit(
        :code, :name, :start_date, :end_date, :percentage, :max_amount, :max_usage,
        :status
      )
    end

    def voucher_usage_paramss
      params.require(:voucher_usage).permit(:voucher_id, :customer_id)
    end
  end
end
