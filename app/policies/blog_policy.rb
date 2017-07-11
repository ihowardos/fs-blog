class BlogPolicy < ApplicationPolicy
   def update?
    user.present? && user == record.user
   end
end
