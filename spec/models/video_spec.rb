require 'rails_helper'

RSpec.describe Video, type: :model do
  it "saves the gets the youtube_id from a youtube url" do
    video = create(:video)
    expect(video.youtube_id).to eq "gx-gyUKThdA"
  end

  it "will not validate video when url not a youtube url" do
    video = build(:video, url: "http://www.ew.com/recap/marvels-agents-of-shield-season-2-finale/4")
    video.valid?
    expect(video.errors[:url]).to include("is invalid")
  end
end
