class EventMembersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @event_members = @user.event_members
    binding.pry
  end

end
