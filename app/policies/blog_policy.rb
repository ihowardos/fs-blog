class BlogPolicy < ApplicationPolicy

  def new?
    user.present?
  end

  def edit?
    user == record.user || user.admin? || user.editor?
  end

  def destroy?
    user == record.user || user.admin? || user.editor?
  end
end


