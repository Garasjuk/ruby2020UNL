
class UserPolicy < ApplicationPolicy
  def index?
      return true if user.present? && user.role.admin_at?
  end

  def show?
      return true if user.present? && user.role.admin_at?
  end

  def create?
    return true if user.present? && user.role.create_at?
  end

  def edit?
  return true if user.present? && user.role.update_at?
    # false
    # record.role.exists?(user_id: user, update: true)
  end


  def destroy?
    return true if user.present? && user.role.delete_at?
  end

end
