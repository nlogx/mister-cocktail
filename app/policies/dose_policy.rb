class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def create?
    user.cocktails.include?(record.cocktail)
  end
end
