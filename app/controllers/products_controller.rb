class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = policy_scope(Product)
    @query = params[:query]

    if @query.present?
      @products = @products.search_by_name_certification(@query)
    end

    if params["filter"]
      puts "-"*50
      p filter_params
      puts "-"*50

      @filter = params["filter"].concat(params["filters"]).flatten.reject(&:blank?)
      @products = Product.all.filter_search("#{@filter}")
    else
      @products = Product.all
    end

    respond_to do |format|
      format.html
      format.json { render json: { products: @products} }
    end
  end

  def show
    @product = Product.find(params[:id])
    @message = Message.new
    authorize @product
  end

  private

  def filter_params
    params.require(:filter).permit(:category => [], :minimum_order_quantity => [], :certifications => {})
  end

end
