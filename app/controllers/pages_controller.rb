class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :aboutus]

  def home
  end

  def aboutus
  end

  def contact_us
  end
end
