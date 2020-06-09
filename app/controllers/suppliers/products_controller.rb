class Suppliers::ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_product, only: [:edit,:update, :destroy,]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @supplier = Supplier.where(user: current_user)
    @product.supplier = @supplier.user
    raise
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category, :production_quantity,:minimum_order_quantity)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end


# t.string "name"
# t.integer "price"
# t.string "category"
# t.integer "production_quantity"
# t.integer "minimum_order_quantity"
