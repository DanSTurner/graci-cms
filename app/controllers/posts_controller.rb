class PostsController < ApplicationController
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def edit
  end

  def show
  end

  def update
    @post.update_attributes(post_params)
    redirect_to root_path
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def set_micropost
      @post = Post.find(params[:id])
    end
end
