class TicketsController < ApplicationController

  def create
    @event = Event.find(params[:id])
    @ticket = @event.tickets.build(ticket_params)
    @ticket.user_id = current_user
    if @ticket.save
      redirect_to event_url(@event), :notice => 'Tickets were purchased'
    else
      redirect_to event_url(@event), :alert => 'Error purchasing tickets'
    end
  end

  private
  def ticket_params
    params.require(:tickets).permit(:num_of_general)
  end

end
