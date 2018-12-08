class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: User.where(admin: true))
    end
  end

  def create?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def destroy?
    user.admin?
  end
end
