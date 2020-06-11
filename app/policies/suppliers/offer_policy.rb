class Suppliers::OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    return true
  end

  def approved?
    return true
  end

  def rejected?
    return true
  end

  def generate_offer?
    return true
  end

  def show?
    return true
  end

  def destroy?
    return true
  end
end
