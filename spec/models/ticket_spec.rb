require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "gives total cost for general tickets" do
    @event = Event.create(start_date: "2015-05-17 19:00:00", end_date: "2015-05-25 19:00:00", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    @show = @event.shows.create(date: "2015-05-19 19:00:00")
    @ticket = create(:ticket)

    result = @ticket.cost_of_tickets

    expect(result).to eq 15
  end
end
