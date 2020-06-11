class Suppliers::OffersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    # @offers = Offer.all
    @offers = policy_scope([:suppliers, Offer])
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def update
  end
end
