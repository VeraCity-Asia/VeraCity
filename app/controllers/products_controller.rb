class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
