class Suppliers::ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    return record.supplier == user.supplier && user.supplier&.information_complete?
  end
  
  def create?
    user.supplier&.information_complete?
  end

  def destroy?
    record.supplier.user == user
  end
  
  
end
