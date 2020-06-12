class Suppliers::OffersController < ApplicationController
  before_action :find_offer, only: [:show,:update,:generateoffer]
  def index
    @offers = policy_scope([:suppliers, Offer])
  end

  def show
    # policy_class: app/policies/suppliers/offer_policy#show
    authorize([:suppliers, @offer])
  end



  def update
    @offer.update(offer_params)
    # policy_class: app/policies/suppliers/offer_policy#show
    authorize([:suppliers, @offer])
    redirect_to generateoffer_suppliers_offer_path(@offer)
  end
  
  def rejected
    # policy_class: app/policies/suppliers/offer_policy#show
    authorize([:suppliers, @offer])
    @offer.rejected
    @offer.update
  end
  
  def generate_offer
    # policy_class: app/policies/suppliers/offer_policy#show
    authorize([:suppliers, @offer])
    #get offer id from approve form
  end


  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.permit(:approved)
  end
end
