class SuppliersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @supplier = Supplier.find(params[:id])
    authorize @supplier
  end
end
