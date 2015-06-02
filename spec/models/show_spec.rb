require 'rails_helper'

RSpec.describe Show, type: :model do
  it "returns true when show falls within event start and end dates" do
    @event = Event.create(start_date: "2015-05-17", end_date: "2015-05-25", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    show = build(:show)
    expect(show.within_event_run?).to be true
  end

  it "returns true when show falls on start date" do
    @event = Event.create(start_date: "2015-05-19", end_date: "2015-05-25", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    show = build(:show)
    expect(show.within_event_run?).to be true
  end

  it "returns true when show falls on end date" do
    @event = Event.create(start_date: "2015-05-17", end_date: "2015-05-19 23:59:59", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    show = build(:show)
    expect(show.within_event_run?).to be true
  end

  it "returns false when show falls outside of event start and end dates" do
    @event = Event.create(start_date: "2015-05-20", end_date: "2015-05-25", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    show = build(:show)
    expect(show.within_event_run?).to be false
  end
end
