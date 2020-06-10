class Purchasers::OffersController < ApplicationController
  before_action :find_offer, only: [:show, :destroy]
  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
    @product = Product.find(params[:product_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @product = Product.find(params[:offer][:product_id])
    @offer.products << @product
    @offer.user = current_user
    @offer.supplier =  @product.supplier
    @offer.save
    raise
    #find the supplier from product supplier
    if @offer.save
      redirect_to purchasers_offers_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:amount, :destination, :price, :payment)
  end
end
