class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:id])
    @friendee = current_user.friendees.build
    @friendee.friendee_id = @user.id
    if @friendee.save
      redirect_to user_path(@user), :notice => "User friended pending acceptance"
    else
      render 'show'
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    if @friendship.save
      redirect_to user_path(current_user), :notice => "Friendship confirmed!"
    end
  end

  def destroy
  end

end
