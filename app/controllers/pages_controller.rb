class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :aboutus, :registration ]

  def home
  end

  def registration
    @user_type = params[:user_type]
  end
  

  def aboutus
  end
end
