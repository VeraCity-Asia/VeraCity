class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = Product.all
    @query = params[:query]

    if @query.present?
      @products = @products.search_by_name_certification(@query)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
