class UserDecorator < ApplicationDecorator
  delegate_all

  def get_username(id)
    user = User.find(id)
    "#{user.name} #{user.surname}"
  end

end
