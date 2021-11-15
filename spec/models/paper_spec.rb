require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should have a title, venue and year" do
    paper = Paper.new(title: "Test Paper", venue: "Test Venue", year: 2021)
    # these are the standard names given to inputs by the Rails form builder
    expect(paper.title).to eq("Test Paper")
    expect(paper.venue).to eq("Test Venue")
    expect(paper.year).to eq(2021)
  end
  it "must have a title" do
    paper = Paper.new(title: nil, venue: "Test Venue", year: 2021)
    expect(paper).not_to be_valid
  end
  it "must have a venue" do
    paper = Paper.new(title: "Test Title", venue: nil, year: 2021)
    expect(paper).not_to be_valid
  end
  it "must have a year that is an integer" do
    paper = Paper.new(title: "Test Title", venue: "Test Venue", year: nil)
    paper2 = Paper.new(title: "Test Title", venue: "Test Venue", year: 202.1)
    expect(paper).not_to be_valid
    expect(paper2).not_to be_valid
  end
  it "should have an empty list of authors" do
    paper = Paper.new(title: "Test Title", venue: "Test Venue", year: 2021)
    expect(paper).to have_attributes(:authors => [])
  end
end
