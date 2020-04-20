# frozen_string_literal: true

class V1::BannersController < ApplicationController
  skip_before_action :authenticate_request

  def active_banners
    @ads = Ad.where(status: true).order(created_at: :desc)

    if @ads.present?
      render json: @ads
    else
      render json: { success: false, message: 'Ad is not available' }
    end
  end
end
