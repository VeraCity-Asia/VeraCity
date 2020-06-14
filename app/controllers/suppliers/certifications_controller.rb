class Suppliers::CertificationsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_certification, only: [:edit,:update]


  def new
    @certification = Certification.new
    @product = current_user.supplier.products.last
    authorize([:suppliers, @certification])
  end
  
  def create
    @certification = Certification.new(certification_params)
    authorize([:suppliers, @certification])
    if @certification.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @certification.update(certification_params)
      redirect_to products_path
    else
      render :edit
    end
  end



  private

  def find_certification
    @certification = Certification.find(params[:id])
  end

  def certification_params
    params.require(:certification).permit(:number, :validity, :category, :listing_number, :code, :authority, photos: [])
  end
end
