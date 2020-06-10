class Suppliers::ProductsController < ApplicationController
  before_action :find_product, only: [:edit,:update, :destroy]
  def new
    @product = Product.new
    # wrong ways to do this
    # Pundit.policy!(user, Product)
    # authorize @product, policy_class: ProductPolicy
    # authorize(product)
    # authorize @product
    # authorize Product
    # authorize(Product)
    # authorize @product
    authorize([:suppliers, @product])  
  end

  def create
    @product = Product.new(product_params)
    supplier = Supplier.find_by(user: current_user)
    @product.supplier = supplier

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
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
