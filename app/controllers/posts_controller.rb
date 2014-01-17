class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :sort]

  def sort
    @post.update_attribute :nav_order_position, params[:post][:nav_order_position]
    @post.save

    render nothing: true
  end

  def index
    @posts = Post.all
    @nav_items = Post.rank(:nav_order).all
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
      params.require(:post).permit(:title, :content, :nav_order)
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end
end
