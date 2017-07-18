class BlogsController < ApplicationController
  expose_decorated :blog
  expose_decorated :blogs, -> {fetch_blogs}

  expose_decorated :comment, -> {Comment.new}

  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def new
    authorize blog
  end

  def create
    blog.user_id = current_user.id
    if blog.save
      redirect_to blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize blog
  end

  def update
    authorize blog

    if blog.update(blog_params)
      redirect_to blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize blog

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
