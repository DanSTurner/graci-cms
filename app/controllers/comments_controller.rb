class CommentsController < ApplicationController

  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.save
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
