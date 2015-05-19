require 'rails_helper'

RSpec.describe Venue, type: :model do
  it 'Adds different address params to create full address' do
    venue = create(:venue)
    result = venue.full_address
    expect(result).to eq '125 Bathurst St, Toronto, Ontario, Canada'
  end
end
