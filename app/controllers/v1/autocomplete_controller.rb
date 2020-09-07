# frozen_string_literal: true

class V1::AutocompleteController < ApplicationController
  skip_before_action :authenticate_request

  def search_products
    @products = Product.where('name ILIKE ?', "%#{params[:name]}%")

    if @products.present?
      render json: @products
    else
      render json: { success: false, message: 'Product is not available' }
    end
  end
end
