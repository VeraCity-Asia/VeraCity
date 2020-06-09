class Suppliers::LicensesController < ApplicationController

  def new
    @license = License.new
  end

  def create
    @license = License.new(license_params)
    raise
    if @license.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @license = License.find(params[:id])
    @license.destroy
  end

  private

  def license_params
    params.require(:license).permit(:authority, :number)
  end
end
