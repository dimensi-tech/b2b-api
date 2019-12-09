module V1
  class TravelDestinationsController < ApplicationController
    before_action :set_travel_destination, only: %i[detail_travel_destination]
    skip_before_action :authenticate_request

    def featured_destinations
      @search              = TravelDestination.limit(4).ransack(params[:q])
      @travel_destinations = @search.result(distinct: true)

      if @travel_destinations.present?
        render json: @travel_destinations
      else
        render json: { success: false, message: 'travel_destination tidak tersedia.' }
      end
    end

    def detail_travel_destination
      if @travel_destination.present?
        render json: { success: true, serializer: travel_destinationserializer, datas: @travel_destination }
      else
        render json: { success: false, messages: "Tujuan Wisata tidak ditemukan." }
      end
    end

    private

    def set_travel_destination
      @travel_destination = TravelDestination.find_by(id: params[:travel_destination_id])
    end
  end
end
