class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(root_url, message: 'Logged in successfully.')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
