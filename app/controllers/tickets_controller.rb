class TicketsController < ApplicationController

  def create
    @ticket = current_user.tickets.build(ticket_params)
    if @ticket.save
      # redirect_to event_url(@event), :notice => 'Tickets were purchased'
      redirect_to user_url(current_user)
    else
      # redirect_to event_url(@event), :alert => 'Error purchasing tickets'
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:num_of_general, :show_id)
  end

end
