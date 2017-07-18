class CommentPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def destroy?
    user == record.user || user.admin? || user.editor?
  end
end


