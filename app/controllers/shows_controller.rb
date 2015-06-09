class ShowsController < ApplicationController

  def show
    @show = Show.find(params[:id])
    @ticket = @show.tickets.build
    respond_to do |format|
      format.js
    end
  end

  def admin
    @show = Show.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
