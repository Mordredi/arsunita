class HomePageController < ApplicationController
  skip_before_filter :require_login

  def index
  end

  def search
    if params[:search]
      @users = User.where("LOWER(first_name) LIKE LOWER(?) OR LOWER(last_name) LIKE LOWER(?)",
                          "%#{params[:search]}%", "%#{params[:search]}%")
      @venues = Venue.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
      @events = Event.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    end

    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def notifications

    @notifications = current_user.notifications.where(:viewed => false)
    @request_notifications = @notifications.where(:notification_type => 0)
    @friend_notifications = @notifications.where(:notification_type => 1)
    @follower_notifications = @notifications.where(:notification_type => 2)

    respond_to do |f|
      f.js {}
    end
  end

end
