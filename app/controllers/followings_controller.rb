class FollowingsController < ApplicationController

  def create
    @user = User.find(params[:id])
    @followee = current_user.followees.build
    @followee.followee_id = @user.id

    respond_to do |format|
      if @followee.save
        format.html { redirect_to user_path(@user), :notice => "User followed" }
        format.js {}
      else
        format.html { render 'show' }
        format.js {}
      end
    end
  end

  def destroy

  end

end
