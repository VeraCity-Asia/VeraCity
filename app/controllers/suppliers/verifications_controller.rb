class Suppliers::VerificationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit]
  def edit
  end

  def update
  end
end
