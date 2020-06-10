class Suppliers::DashboardController < ApplicationController
  def index
    @user = current_user
    @supplier = Supplier.find_by(user: current_user)
  end
end
