require 'rails_helper'

describe "Index paper page", type: :feature do
  it "should exist at 'papers_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit papers_path
  end
  it "should filter papers by year if provided in the url" do
    @paper1 = FactoryBot.create :paper
    @paper2 = FactoryBot.create(:paper, title: "Paper 2", venue: "Venue", year: 1968)
    @paper2.year = 1968
    visit papers_path(year: @paper1.year)
    expect(page).to have_css('td', text: @paper1.title)
    expect(page).not_to have_css('td', text: @paper2.title)
  end
end
