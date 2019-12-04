class V1::PackagesController < ApplicationController
  before_action :set_package, only: %i[package_detail]

  def index
    @packages = Package.all

    if @packages.present?
      render json: @packages
    else
      render json: { success: false, message: 'packages is not available.' }
    end
  end

  def package_detail
    if @package.present?
      render json: @package, serializer: PackageSerializer
    else
      render json: { success: false, message: 'package not found.' }
    end
  end

  private

  def set_package
    @package = Package.find_by(id: params[:package_id])
  end
end
