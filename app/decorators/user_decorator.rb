class UserDecorator < ApplicationDecorator
  delegate_all

  def blogs_count(id)
    count = Blog.where(user_id: id).count
    count
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
