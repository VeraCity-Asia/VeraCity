class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = policy_scope(Product)
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

end
