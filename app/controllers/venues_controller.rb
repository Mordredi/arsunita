class VenuesController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = current_user.venues.build(venue_params)
    if @venue.save
      redirect_to venue_url(@venue), :notice => 'Created venue'
    else
      flash.now[:alert] = 'Venue did not save'
      render 'new'
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(venue_params)
      redirect_to venue_url(@venue), :notice => 'Venue updated'
    else
      flash.now[:alert] = 'Venue did not update'
      render 'edit'
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.delete
    redirect_to venues_url, :notice => 'Venue deleted'
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :description, :num_of_seats, :address_one, :city, :province, :country)
  end

end
