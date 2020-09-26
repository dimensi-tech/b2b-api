# frozen_string_literal: true

class V1::CustomersController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_customer, only: %i[confirm_email]

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      ConfirmationJob.perform_later(@customer.id)
      @customer.update(confirmation_sent_at: Time.now)
      render json: @customer
    else
      render json: { success: false, message: @customer.errors.full_messages }
    end
  end

  def confirm_email
    if @customer.present? && @customer.confirmed_at.nil?
      @customer.confirmed_at = Time.now
      @customer.save(validate: false)
    end
  end

  def create_profile
    @customer = Customer.find_by(id: params[:customer_id])

    if @customer.present?
      CustomerProfile.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        company_name: params[:company_name],
        phone_number: params[:phone_number],
        customer_id: @customer.id
      )
      render json: @customer, serializer: CustomerSerializer
    else
      render json: { success: false, message: 'Customer id Not Found' }
    end
  end

  private

  def set_customer
    @customer = Customer.find_by(id: params[:id])
  end

  def customer_params
    params.permit(:email, :password)
  end
end
