class FavoritesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.favorites
    end
  end

  def index?
    true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
