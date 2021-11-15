require 'rails_helper'

describe "Edit paper page", type: :feature do
  it "should exist at 'edit_paper_path(paper)' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
  end
  it "should have text inputs for a papers title, venue, year and authors" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
    expect(page).to have_field('paper[author_ids][]')
  end
  it "should have a submit button" do
    @paper = FactoryBot.create :paper
    visit edit_paper_path(@paper)
    expect(page).to have_css('input[type="submit"]')
  end
  it "should update an edited paper in the database" do
    @paper = FactoryBot.create :paper
    paper_id = @paper.id
    visit edit_paper_path(@paper)
    page.fill_in 'paper[title]', with: 'new_title'
    page.fill_in 'paper[venue]', with: 'new_venue'
    page.fill_in 'paper[year]', with: 2018
    # ...
    find('input[type="submit"]').click
    @paper.reload
    expect(Paper.find_by(id: paper_id).title).to eq("new_title")
    expect(Paper.find_by(id: paper_id).venue).to eq("new_venue")
    expect(Paper.find_by(id: paper_id).year).to eq(2018)
  end
end
