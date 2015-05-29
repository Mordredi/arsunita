class TicketsController < ApplicationController
  def index
    @tickets = current_user.tickets

    respond_to do |format|
      format.js
    end
  end

  def create
    @ticket = current_user.tickets.build(ticket_params)
    @event = @ticket.event
    if @ticket.save
      redirect_to event_url(@event), :notice => 'Tickets were purchased'
    else
      redirect_to event_url(@event), :alert => 'Error purchasing tickets'
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:num_of_general, :show_id)
  end

end
