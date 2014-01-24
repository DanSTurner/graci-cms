class CommentsController < ApplicationController
  before_action :set_post
  before_action :check_admin, only: [:destroy]
  # before_action :require_login, only: [:create]

  def create
    unless current_user
      redirect_back_or_to login_path, notice: "Login required to comment."
    else
      @comment = @post.comments.create(comment_params)
      @comment.update_attribute(:user_id, current_user.id)
      @comment.save
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_post
      @post = Post.friendly.find(params[:post_id])
    end

end
