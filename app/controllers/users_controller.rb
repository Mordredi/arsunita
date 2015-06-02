class UsersController < ApplicationController

  skip_before_filter :require_login, only: [:index, :new, :create, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @event_members = @user.event_members
    if current_user
      if current_user.arts_worker?
        @video = current_user.videos.build
        @image = current_user.images.build
      end
    end
  end

  def new
    if params[:arts_worker] == "true"
      @artist = true
    end
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
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to user_url(@user), :notice => 'User Updated' }
        format.js {}
      else
        format.html { flash.now[:alert] = 'User edit failed'; render 'edit'}
        format.js {}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_url, :notice => 'User deleted'
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :profession, :description, :avatar, :arts_worker, :avatar_cache)
  end

end
