class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = policy_scope(Product)
    @query = params[:query]

    if @query.present?
      @products = @products.search_by_name_certification(@query)
    end

    # if params["filter"]
    #   @filter = params["filter"]
    #   @products = Product.all.filter_search("#{@filter}")
    # else
    #   @products = Product.all
    # end

    # respond_to do |format|
    #   format.html
    #   format.json { render json: { products: @products} }
    # end
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end
end
