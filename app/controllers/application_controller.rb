class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_navbar
  before_action :set_admin

  private

    def set_navbar
      @nav_items = Post.rank(:nav_order).where(include_in_nav: true)
    end

    def set_admin
      current_user && current_user.admin == true ? @admin = true : @admin = false
    end

    def check_admin
      unless @admin == true
        redirect_to root_path, notice: 'Must be admin.'
      end
    end

    def authorized_user
      unless @admin == true || @user == current_user
        redirect_to root_url, notice: 'You are not logged in or are logged in as the wrong.'
      end
    end
end
