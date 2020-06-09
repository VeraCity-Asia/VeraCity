class Purchasers::OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
