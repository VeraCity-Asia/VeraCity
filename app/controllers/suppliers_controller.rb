class SuppliersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_supplier, only: [:show,:edit,:update]

  def show
    authorize @supplier
  end

  def edit
    authorize @supplier
  end

  def update
    authorize @supplier
    if @supplier.update(supplier_params)
      redirect_to suppliers_dashboard_path
    else
      render :edit
    end
  end


  private

  def supplier_params
    params.require(:supplier).permit(:name, :location, :industry, :delivery_terms, :payment_terms, :fei_number, :nearest_port, :established)
  end

  def find_supplier
    @supplier = Supplier.find(params[:id])
  end
end
