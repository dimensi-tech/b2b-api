class V1::PackagesController < ApplicationController
  before_action :set_package, only: %i[show]

  def index
    @packages = Package.all

    if @packages.present?
      render json: @packages
    else
      render json: { success: false, message: 'packages is not available.' }
    end
  end

  def show
    if @package.present?
      render json: @package
    else
      render json: { success: false, message: 'package not found.' }
    end
  end

  private

  def set_package
    @package = Package.find_by(id: params[:id])
  end
end
