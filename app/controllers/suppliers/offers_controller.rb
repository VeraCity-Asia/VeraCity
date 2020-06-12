class Suppliers::OffersController < ApplicationController
  before_action :find_offer, only: [:show,:update,:generateoffer]
  def index
    @offers = policy_scope([:suppliers, Offer])
  end

  def show
    # policy_class: app/policies/suppliers/offer_policy#show
    authorize([:suppliers, @offer])
  end



  def update
    @offer.update(offer_params)
    # policy_class: app/policies/suppliers/offer_policy#show
    authorize([:suppliers, @offer])
    redirect_to suppliers_offer_path(@offer)
  end

  def generateoffer
    authorize([:suppliers, @offer])
    # policy_class: app/policies/suppliers/offer_policy#show
    html = render_to_string(:generateoffer => "generateoffer.html.erb",:layout => false)
    kit = PDFKit.new(html, :page_size => 'Letter')
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pages/suppliers/offers/_generateoffer.scss"
    kit.to_pdf
    send_data(kit.to_pdf, :filename => "mypdf.pdf", :type => "application/pdf")
  end


  private

  def find_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.permit(:approved)
  end
end
