class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # only restaurant owners can update
    record.user == user
  end

  def create?
    # any logged in user can create a restaurant
    !user.nil?
  end
end
