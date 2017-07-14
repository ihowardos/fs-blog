class UserDecorator < ApplicationDecorator
  delegate_all

  def blogs_count
    count = user.blogs.count
    count
  end

  def age
    dob = user.date_of_birth
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
