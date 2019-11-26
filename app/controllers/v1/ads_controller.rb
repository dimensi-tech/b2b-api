class V1::AdsController < ApplicationController
  def active_ads
    @ads = Ad.where(status: true).order(created_at: :desc)

    if @ads.present?
      render json: @ads
    else
      render json: { success: false, message: 'Ad is not available' }
    end
  end
end
