require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path(author)' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end
  it "should have text inputs for an author's first name, last name, and homepage" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
  it "should have a submit button" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
    expect(page).to have_css('input[type="submit"]')
  end
  it "should update an edited author in the database" do
    @alan = FactoryBot.create :author
    alans_id = @alan.id
    visit edit_author_path(@alan)
    page.fill_in 'author[first_name]', with: 'Joan'
    page.fill_in 'author[last_name]', with: 'Clarke'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Joan_Clarke'
    # ...
    find('input[type="submit"]').click
    @alan.reload
    expect(Author.find_by(id: alans_id).first_name).to eq("Joan")
    expect(Author.find_by(id: alans_id).last_name).to eq("Clarke")
    expect(Author.find_by(id: alans_id).homepage).to eq("http://wikipedia.org/Joan_Clarke")
  end
end
