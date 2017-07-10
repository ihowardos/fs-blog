class BlogsController < ApplicationController
  expose_decorated :blog
  expose_decorated :blogs, -> { fetch_blogs }

  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def create
    blog.user_id = current_user.id
    if blog.save
      redirect_to blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def edit
    if current_user != blog.user || current_user.nil?
      redirect_to blog
    end
  end

  def update
    if blog.update(blog_params)
      redirect_to blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private
    def fetch_blogs
      blogs = Blog.all
      blogs = Blog.where(user_id: params[:user_id]).order(:created_at) if params[:user_id]
      blogs
    end

    def blog_params
      params.require(:blog).permit(:title, :text)
    end
end
