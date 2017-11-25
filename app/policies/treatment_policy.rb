class TreatmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    record.specialist == user.specialist
  end

  def create?
    record.specialist == user.specialist
  end
end
