class SpecialistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin
        scope.all
      else
        scope.joins(:user).merge(User.where(:admin => false)).order(:rating)
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    record.user == user
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end
end
