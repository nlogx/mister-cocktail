class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: User.where(admin: true))
    end
  end

  def dashboard?
    create?
  end

  def index?
    create?
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
