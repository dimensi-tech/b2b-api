# frozen_string_literal: true

module V1
  class BiodatasController < ApplicationController
    before_action :set_biodata, only: %i[detail_biodata]

    def create_biodata
      @biodata = Biodata.new(biodata_params)

      if @biodata.save
        render json: @biodata, serializer: BiodataSerializer
      else
        render json: { success: false, message: 'Error Create biodata' }
      end
    end

    def detail_biodata
      if @biodata.present?
        render json: @biodata, serializer: BiodataSerializer
      else
        render json: { success: false, message: 'Cannot find biodata Id' }
      end
    end

    private

    def set_biodata
      @biodata = Biodata.find_by(id: params[:biodata_id])
    end

    def biodata_params
      params.require(:biodata)
            .permit(:name, :email, :phone, :heir_name, :heir_contact, :family_relation)
    end
  end
end
