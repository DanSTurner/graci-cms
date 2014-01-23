class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :sort]
  before_action :check_admin, only: [:new, :edit, :create, :update, :destroy, :sort, :all]

  def sort
    @post.update_attribute :nav_order_position, params[:post][:nav_order_position]
    @post.save

    render nothing: true
  end

  def index
    if User.any? == false
      redirect_to new_user_path, notice: 'Create admin user.'
    elsif Post.any?
      @post = Post.rank(:nav_order).first
      @comment = @post.comments.build
      @comments = @post.comments(true)
    else
      redirect_to new_post_path, notice: 'Create first post.'
    end
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
      redirect_to post_path(@post), notice: 'Post created successfully.'
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
    redirect_to root_path, notice: 'Post edited successfully.'
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post deleted successfully.'
  end



  private
    def post_params
      params.require(:post).permit(:title, :content, :include_in_nav)
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end

end
