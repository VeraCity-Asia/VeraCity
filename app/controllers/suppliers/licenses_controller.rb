class Suppliers::LicensesController < ApplicationController

  def new
    @license = License.new
    authorize @license
  end

  def create
    @license = License.new(license_params)
    supplier = Supplier.find_by(user: current_user)
    @license.supplier = supplier
    authorize @license
    if @license.save
      redirect_to suppliers_dashboard_path, notice: 'Your license was successfully created.'
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
    params.require(:license).permit(:authority, :number, :start_date, :expired_date, photos: [])
  end
end
