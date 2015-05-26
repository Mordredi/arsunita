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

end
