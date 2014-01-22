class StaticPagesController < ApplicationController
  def index
    @post = Post.rank(:nav_order).first
  end
end
