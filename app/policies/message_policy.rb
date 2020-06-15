class MessagePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end
end
