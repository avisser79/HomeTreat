class AvailabilityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      elsif user.is_specialist
        scope.where(specialist: user.specialist)
      end
    end
  end

  def index?
    user.is_specialist
  end

  def new?
    create?
  end

  def create?
    user.is_specialist
  end

  def edit?
    record.specialist == user.specialist
  end

  def update?
    edit?
  end

  def show?
    true
  end
end
