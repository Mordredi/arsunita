class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @venues = Venue.all
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
    params.require(:event).permit(:name, :description, :start_date, :end_date, :price_for_general, :venue_id, :shows_attributes => [:id, :date])
  end

end
