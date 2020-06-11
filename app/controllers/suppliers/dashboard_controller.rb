class Suppliers::DashboardController < ApplicationController
  # we don't use policy_scoped here; no associated model
  skip_after_action :verify_policy_scoped

  def index
    @user = current_user
    @supplier = Supplier.find_by(user: current_user)
    
    # policy_class: app/policies/suppliers/dashboard_policy#index
    authorize @supplier, policy_class: Suppliers::DashboardPolicy

  end
end
