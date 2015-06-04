class EventMembersController < ApplicationController

  def members
    @event = Event.find(params[:id])
    @members = @event.event_members
  end

  def create
    @event = Event.find(params[:id])
    @member = @event.event_members.build(event_member_params)
    respond_to do |format|
      if @member.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end
  end

  private
  def event_member_params
    params.require(:event_member).permit(:user_id, :role, :admin)
  end

end
