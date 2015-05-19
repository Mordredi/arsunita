require 'rails_helper'

RSpec.describe Show, type: :model do
  it "returns true when show falls within event start and end dates" do
    @event = Event.create(start_date: "2015-05-17 19:00:00", end_date: "2015-05-25 19:00:00", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    show = create(:show)
    result = show.within_event_run?
    expect(result).to eq true
  end

  it "returns false when show falls outside of event start and end dates" do
    @event = Event.create(start_date: "2015-05-20 19:00:00", end_date: "2015-05-25 19:00:00", id: 1, name: "Show!", description: "Best Show Ever!", price_for_general: 15)
    show = create(:show)
    result = show.within_event_run?
    expect(result).to eq false
  end
end
