class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    puts "—" * 50
    if resource.supplier?
      suppliers_dashboard_path
    elsif resource.purchaser?
      products_path
    end
  end
end
