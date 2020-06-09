class Suppliers::CertificationsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :edit]


  def new
    @certification = Certification.new
  end

  def create
    @certification = Certification.new(certification_params)
    raise
  end

  def edit
  end

  def update
  end



  private

  def find_certification
    @certification = Certification.find(params[:id])
  end

  def certification_params
    params.require(:certification).permit(:number, :validity, :category, :listing_number, :code, :authority)
  end
end
