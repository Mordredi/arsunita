require 'rails_helper'

RSpec.describe Ticket, type: :model do

  before(:each) do
    @venue = Venue.create(name: "Yada", description: "Yadayada", num_of_seats: 100, address_one: "222 Spring St", city: "toronto", province: "Ontarion", country: "Canada")
    @event = Event.create(start_date: "2015-05-17 19:00:00", end_date: "2015-05-25 19:00:00", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15, venue_id: 1)
    @show = @event.shows.create(date: "2015-05-19 19:00:00")
    @ticket = create(:ticket)
  end

  it "gives total cost for general tickets" do

    result = @ticket.cost_of_tickets

    expect(result).to eq 15
  end

  it "Will allow ticket purchase if room available for show" do
    result = @ticket.check_capacity

    expect(result).to eq true

  end

  it "Will allow ticket purchase if room available for show" do

    @ticket = create(:ticket, num_of_general: 101)

    result = @ticket.check_capacity

    expect(result).to eq false

  end

end
