class UserSessionsController < ApplicationController

  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
       redirect_to user_url(@user), :notice => 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end

  private
  def session_params
    params.require(:user_sessions).permit(:email, :password)
  end

end
