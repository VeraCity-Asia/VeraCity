class MessagePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end


  def by_product?
    true
  end
end
