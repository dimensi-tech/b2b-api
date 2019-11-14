class V1::CustomersController < ApplicationController
  def create
    input = Customer.new(customer_params)
    input.save ? :ok : :bad_request
  end

  private

  def customer_params
    params.permit(:email, :password)
  end
end