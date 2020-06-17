class Suppliers::DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.find_by(user: current_user)
    end
  end

  def index?
    user.supplier?
  end
  

  # def update?
  #   record.supplier.user == user
  # end  
  
  # def create?
  #   return true
  # end

  # def destroy?
  #   record.supplier.user == user
  # end
  
  
end
