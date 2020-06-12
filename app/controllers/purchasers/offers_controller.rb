class Purchasers::OffersController < ApplicationController
  before_action :find_offer, only: [:show, :destroy]

  def index
    @offers = policy_scope([:purchasers, Offer])
  end

  def show
    # policy_class: app/policies/purchasers/offer_policy#show
    authorize([:purchasers, @offer])
  end

  def new
    @offer = Offer.new
    # policy_class: app/policies/purchasers/offer_policy#create 
    authorize([:purchasers, @offer])
    @product = Product.find(params[:product_id])
  end

  def create
    @offer = Offer.new(offer_params)
    @product_offer = ProductOffer.new(product_offer_params)
    @product = Product.find(params[:offer][:product_id])
    @offer.products << @product
    @offer.user = current_user
    @offer.supplier = @product.supplier
    @product_offer.product_id = @product.id
    # policy_class: app/policies/purchasers/offer_policy#create 
    authorize([:purchasers, @offer])
    if @offer.save
      @product_offer.offer_id = @offer.id
      @product_offer.save
      redirect_to purchasers_offer_path(@offer)
    else
      # policy_class: app/policies/purchasers/offer_policy#create 
      authorize([:purchasers, @offer])
      render :new
    end
  end

  def destroy
    @offer.destroy
    # policy_class: app/policies/offer_policy#destroy
    authorize([:purchasers, @offer])
    redirect_to purchasers_offers_path
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:destination, :payment)
  end

  def product_offer_params
    params.require(:offer).permit(:amount)
  end
end
