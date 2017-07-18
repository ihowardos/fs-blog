class BlogDecorator < ApplicationDecorator
  delegate_all

  def comments_count
    count = blog.comments.count
    count
  end

end
