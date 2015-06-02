require 'rails_helper'

RSpec.describe Event, type: :model do
  it "event end_date saves to end of day" do
    event = create(:event)
    expect(event.end_date).to eq "2015-05-19 23:59:59 UTC +00:00"
  end
end
