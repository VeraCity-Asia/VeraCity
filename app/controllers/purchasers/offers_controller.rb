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
    @product = Product.find(params[:product_id])
    @offer = Offer.offer_for_product(current_user, @product)
    # policy_class: app/policies/purchasers/offer_policy#create
    authorize([:purchasers, @offer])
  end

  def create
    @product = Product.find(params[:offer][:product_id])
    @offer = Offer.add_product(current_user, @product, product_offer_params[:amount], offer_params)
    authorize([:purchasers, @offer])
    if @offer.id
      redirect_to purchasers_offer_path(@offer)
    else
      render :new
    end
  end

  def update
    create
  end

  def destroy
    @offer.destroy
    # policy_class: app/policies/offer_policy#destroy
    authorize([:purchasers, @offer])
    redirect_to purchasers_dashboard_path
  end

  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:destination, :payment)
  end

  def product_offer_params
    params.require(:offer).require(:product_offer).permit(:amount)
  end
end
