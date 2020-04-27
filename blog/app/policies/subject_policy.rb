
class SubjectPolicy < ApplicationPolicy
  def index?
    true
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
