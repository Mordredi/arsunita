class EventsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @shows = @event.shows
    @ticket = Ticket.new
    @event_members = @event.event_members
  end

  def new
    @event = Event.new
    @venues = Venue.all
    @users = User.where(arts_worker: true)
    @categories = Category.all
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_url(@event), :notice => 'Created Event'
    else
      flash.now[:alert] = 'Event did not save'
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @venues = Venue.all
    @users = User.where(arts_worker: true)
  end

  def update
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
      :name, :description, :start_date, :end_date, :price_for_general, :venue_id, :category_id,
      :shows_attributes => [:id, :date, :time, :_destroy],
      :event_members_attributes => [:role, :admin, :user_id, :_destroy]
    )
  end

end
