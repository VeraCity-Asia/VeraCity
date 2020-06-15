class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = policy_scope(Product)
    @query = params[:query]

    if @query.present?
      @products = @products.search_by_name_certification(@query)
    end
  end

  def show
    @product = Product.find(params[:id])
    @message = Message.new
    authorize @product
  end
end
