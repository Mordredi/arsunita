class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.confirmed_friends

    respond_to do |format|
      format.js
    end
  end

  def requests
    @requests = current_user.frienders.where(confirmed: false)

    respond_to do |format|
      format.js
    end
  end

  def create
    @user = User.find(params[:id])
    @friendee = current_user.friendees.build
    @friendee.friendee_id = @user.id
    @friendee.save
    respond_to do |format|
      if @friendee.save
        @notification = @user.notifications.create
        format.html { redirect_to user_path(@user), :notice => "User friended pending acceptance" }
        format.js
      else
        format.html { render 'show' }
        format.js
      end
    end

  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    respond_to do |format|
      if @friendship.save
        format.html { redirect_to user_path(@user), :notice => "User friended pending acceptance" }
        format.js
      else
        format.html { render 'show' }
        format.js
      end
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    respond_to do |format|
      if @friendship.delete
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end

end
