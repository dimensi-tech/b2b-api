class V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[product_detail]

  def list_products
    @products = Product.all

    if @products.present?
      render json: @products
    else
      render json: { success: false, message: 'products is not available' }
    end
  end

  def product_detail
    if @product.present?
      render json: @product
    else
      render json: { success: false, message: 'product not found' }
    end
  end

  private

  def set_product
    @product = Product.where(id: params[:product_id]).last
  end
end
