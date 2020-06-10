class Suppliers::ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.supplier.user == user
  end  
  
  def create?
    return true
  end

  def destroy?
    record.supplier.user == user
  end
  
  
end
