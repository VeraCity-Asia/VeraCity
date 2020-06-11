class Purchasers::DashboardController < ApplicationController
  # we don't use policy_scoped here; no associated model
  skip_after_action :verify_policy_scoped

  def index
    @user = current_user
    authorize @user, policy_class: Purchasers::DashboardPolicy
  end
end
