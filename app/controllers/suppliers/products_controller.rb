class Suppliers::ProductsController < ApplicationController
  before_action :find_product, only: [:edit,:update, :destroy]
  def new
    @product = Product.new
    authorize([:suppliers, @product])
  end

  def create
    @product = Product.new(product_params)
    supplier = Supplier.find_by(user: current_user)
    @product.supplier = supplier
    if @product.save
      authorize([:suppliers, @product])
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    authorize([:suppliers, @product])
  end

  def update
    if @product.update(product_params)
      authorize([:suppliers, @product])
      redirect_to @product
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    authorize([:suppliers, @product])
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category, :production_quantity,:minimum_order_quantity, photos: [])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
