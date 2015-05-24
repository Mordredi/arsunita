class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:index, :new, :create, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to user_url(@user), :notice => 'User Created'
    else
      flash.now[:alert] = 'User creation failed'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_url(@user), :notice => 'User Updated'
    else
      flash.now[:alert] = 'User edit failed'
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_url, :notice => 'User deleted'
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :profession, :description, :avatar, :arts_worker)
  end

end
