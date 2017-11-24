class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      elsif user.is_specialist
        scope.where(specialist: user)
      elsif !user.is_specialist
        scope.where(user: user)
      end
    end
  end

  def index?
    true
  end

  def show?
    record.specialist == user.specialist || record.user == user
  end

  def create?
    record.specialist != user.specialist
  end

  def new?
    create?
  end

  def update?
    record.specialist == user.specialist || record.user == user
  end

  def edit?
    update?
  end
end
