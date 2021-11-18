require 'rails_helper'

describe "New paper page", type: :feature do
  it "should exist at 'new_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_paper_path
  end
  it "should have text inputs for a papers title, venue, and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end
  it "should have a submit button" do
    visit new_paper_path
    expect(page).to have_css('input[type="submit"]')
  end
  it "should save a newly created paper to the database" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Test Title'
    page.fill_in 'paper[venue]', with: 'Test Venue'
    page.fill_in 'paper[year]', with: 2021
    # ...
    find('input[type="submit"]').click
    expect(Paper.find_by(title: "Test Title", venue: "Test Venue", year: 2021)).not_to be(nil)
  end
end
