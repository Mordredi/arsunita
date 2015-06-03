require 'rails_helper'

RSpec.describe Event, type: :model do
  it "event end_date saves to end of day" do
    event = create(:event)
    expect(event.end_date).to eq "2015-05-25 23:59:59.999999999 +0000"
  end
end
