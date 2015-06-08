class FollowingsController < ApplicationController

  def index
    @followings = current_user.followed_users

    respond_to do |format|
      format.js
    end
  end

  def followers
    @followers = current_user.users_following
    @notifications = Notification.where(notification_type: 2)
    @notifications.each do |notification|
      notification.update_attributes(viewed: true)
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.find(params[:id])
    @followee = current_user.followees.build
    @followee.followee_id = @user.id
    respond_to do |format|
      if @followee.save
        @notification = @user.notifications.create(notification_type: 2)
        format.html { redirect_to user_path(@user), :notice => "User followed" }
        format.js
      else
        format.html { render 'show' }
        format.js
      end
    end
  end

  def destroy

  end

end
