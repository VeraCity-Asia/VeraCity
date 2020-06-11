class Suppliers::OffersController < ApplicationController
  before_action :find_offer, only: [:show,:update]
  def index
    @offers = Offer.all
  end

  def show
  end

  def update
    if
    end
  end


  private

  def find_offer
    @offer = Offer.find(params[:id])
  end
end
