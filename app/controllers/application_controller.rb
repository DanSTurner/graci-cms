class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_navbar

  private

    def set_navbar
      @nav_items = Post.rank(:nav_order).where(include_in_nav: true)
    end
end
