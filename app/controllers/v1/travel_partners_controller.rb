module V1
  class TravelPartnersController < ApplicationController
    skip_before_action :authenticate_request

    def featured_travel_partners
      @search              = TravelPartner.all.ransack(params[:q])
      @travel_partners     = @search.result(distinct: true)

      if @travel_partners.present?
        render json: @travel_partners
      else
        render json: { success: false, message: 'Travel partner tidak tersedia.' }
      end
    end
  end
end
