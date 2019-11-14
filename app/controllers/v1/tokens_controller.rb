class V1::TokensController < ApplicationController
  def create
    customer = Customer.find_by(email: params[:email])
    if customer&.authenticate(params[:password])
      render json: {
        jwt: encode_token({id: customer.id, email: customer.email})
      }
    else
      head :not_found
    end
  end

  private
  
  def encode_token(payload={})
    expired = 24.hours.from_now
    payload[:expired] = expired.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
