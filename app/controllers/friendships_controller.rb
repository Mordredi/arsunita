class FriendshipsController < ApplicationController

  def create
    @user = User.find(params[:id])
    @friendee = current_user.friendees.build
    @friendee.friendee_id = @user.id
    @friendee.save
    respond_to do |format|
      if @friendee.save
        format.html { redirect_to user_path(@user), :notice => "User friended pending acceptance" }
        format.js {  }
      else
        format.html { render 'show' }
        format.js {}
      end
    end

  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to user_path(@user), :notice => "User friended pending acceptance" }
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
