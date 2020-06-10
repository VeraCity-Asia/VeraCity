class Suppliers::DashboardController < ApplicationController
  def show
    @supplier = Supplier.find(params[id])
  end
end
