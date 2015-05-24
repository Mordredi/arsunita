class FollowingsController < ApplicationController

  def create
    @user = User.find(params[:id])
    @followee = current_user.followees.build
    @followee.followee_id = @user.id
    if @followee.save
      redirect_to user_path(@user), :notice => "User followed"
    else
      render 'show'
    end
  end

  def destroy

  end

end
