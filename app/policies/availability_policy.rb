class AvailabilityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      elsif user.is_specialist
        scope.where(specialist: user.specialist)
      end
    end

    def index?
      user.is_specialist
    end

    def new?
      user.is_specialist
    end

    def create?
      new?
    end

    def edit?
      record.specialist == user.specialist
    end

    def update?
      edit?
    end
  end
end
