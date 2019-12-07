class V1::TokensController < ApplicationController
  skip_before_action :authenticate_request

  def create
    command = AuthenticateCustomer.call(params[:email], params[:password])
    if command.success?
      render json: { jwt: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
