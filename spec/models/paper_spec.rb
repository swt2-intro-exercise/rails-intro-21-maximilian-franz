require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should have a title" do
    paper = Paper.new(title: "Test Paper", venue: "Test Venue", year: 2021)
    # these are the standard names given to inputs by the Rails form builder
    expect(paper.title).to eq("Test Paper")
    expect(paper.venue).to eq("Test Venue")
    expect(paper.year).to eq(2021)
  end
end
