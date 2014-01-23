class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :sort]

  def sort
    @post.update_attribute :nav_order_position, params[:post][:nav_order_position]
    @post.save

    render nothing: true
  end

  def index
    @post = Post.rank(:nav_order).first
    @comment = @post.comments.build
    @comments = @post.comments(true)
  end

  def all
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.update_attribute :nav_order_position, Post.maximum("nav_order") + 100
    end
    if @post.save
      redirect_to post_path(@post)
    else
      render nothing: true
    end
  end

  def edit
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments(true)
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
      params.require(:post).permit(:title, :content, :include_in_nav)
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end
end
