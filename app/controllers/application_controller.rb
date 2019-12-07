class ApplicationController < ActionController::API
  # protect_from_forgery except: :create
  before_action :authenticate_request
  attr_reader :current_customer

  private

  def authenticate_request
    @current_customer = AuthorizeApiRequest.call(request.headers)
    if @current_customer
      @current_customer = @current_customer.result
    else
      render json: { error: @current_customer.errors }, status: 401
    end
  end
end
