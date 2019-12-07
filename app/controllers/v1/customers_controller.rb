class V1::CustomersController < ApplicationController
  skip_before_action :authenticate_request

  def create
    input = Customer.new(customer_params)
    if input.save
      render json: input
    else
      render json: { success: false, message: input.errors }
    end
  end

  private

  def customer_params
    params.permit(:email, :password)
  end
end