# frozen_string_literal: true

class V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[product_detail]
  skip_before_action :authenticate_request

  def list_products
    search = Product.order(created_at: :desc).ransack(params[:q])
    @products = search.result(distinct: true).page(params[:page])
    if @products.present?
      product = @products.map {|n| ProductSerializer.new(n, root:false)}
      render json: { product: product,
                     meta: { current_page: @products.current_page,
                             next_page: @products.next_page,
                             prev_page: @products.prev_page,
                             total_pages: @products.total_pages,
                             total_count: @products.total_count } }
    else
      render json: { success: false, message: 'products is not available' }
    end
  end

  def product_detail
    if @product.present?
      render json: @product, serializer: ProductDetailSerializer
    else
      render json: { success: false, message: 'product not found' }
    end
  end

  private

  def set_product
    @product = Product.where(id: params[:product_id]).last
  end
end
