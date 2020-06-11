class Suppliers::OffersController < ApplicationController
  before_action :find_offer, only: [:show,:update, :approved, :rejected, :generateoffer]
  def index
    @offers = Offer.all
  end

  def show
  end



  def approved
    @offer.approved
    @offer.update
    redirect_to generateoffer_suppliers_offer_path(@offer)
  end

  def rejected
    @offer.rejected
    @offer.update
  end

  def generateoffer
    #get offer id from approve form
  end


  private

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
