class CommentsController < ApplicationController
  expose_decorated :comment
  expose_decorated :comments, -> {fetch_comments}

  def create
    comment.save
    redirect_to :back
  end

  def update
    if comment.update(comment_params)
      redirect_to comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
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
