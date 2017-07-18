class CommentsController < ApplicationController
  expose_decorated :comment
  expose_decorated :comments, -> {fetch_comments}

  before_action :authenticate_user!

  def create
    authorize comment
    comment.save
    redirect_to :back
  end

  def destroy
    authorize comment
    comment.destroy
    redirect_to :back, notice: 'Comment was successfully destroyed.'
  end

  private

    def fetch_comments
      comments = Comment.all
    end

    def comment_params
      params.require(:comment).permit(:user_id, :blog_id, :text)
    end
end
