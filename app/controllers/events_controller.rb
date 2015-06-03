class EventsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @categories = Category.all
    if params[:search]
      if params[:search].to_i == @categories.length + 1
        @events = Event.all
      else
        @events = Event.where(category_id: params[:search])
      end
    elsif params[:longitude] && params[:latitude]
      @venues = Venue.near([params[:latitude], params[:longitude]], 1, units: :km)
      @events = @venues.map {|venue| venue.events }
      @events.flatten!
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @event = Event.find(params[:id])
    @shows = @event.shows
    @ticket = Ticket.new
    @event_members = @event.event_members
  end

  def new
    @companies = current_user.companies
    @event = Event.new
    @venues = Venue.all
    @users = User.where(arts_worker: true)
    @categories = Category.all
  end

  def create
    @companies = current_user.companies
    @users = User.all
    @venues = Venue.all
    @categories = Category.all
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_url(@event), :notice => 'Created Event'
    else
      flash.now[:alert] = 'Event did not save'
      render 'new'
    end
  end

  def edit
    @companies = current_user.companies
    @event = Event.find(params[:id])
    @venues = Venue.all
    @users = User.where(arts_worker: true)
    @categories = Category.all
  end

  def update
    @companies = current_user.companies
    @users = User.where(arts_worker: true)
    @venues = Venue.all
    @categories = Category.all
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to event_url(@event), :notice => 'Event updated'
    else
      flash.now[:alert] = 'Event did not update'
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to events_url, :notice => 'Event deleted'
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :description, :start_date, :end_date, :price_for_general, :venue_id, :category_id, :image, :company_id,
      :shows_attributes => [:id, :date, :time, :_destroy],
      :event_members_attributes => [:role, :admin, :user_id, :_destroy]
    )
  end

end
