require 'rails_helper'

describe "Author index page", type: :feature do
    it "should exist at 'authors_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit authors_path
    end
    it "should display all saved authors names and homepages" do
        @author = FactoryBot.create :author
        visit authors_path
        expect(page).to have_css('td', text: @author.name)
        expect(page).to have_css('td', text: @author.homepage)
    end
    it "should have links to each authors edit and show page" do
        @author = FactoryBot.create :author
        visit authors_path
        expect(page).to have_link 'Show', href: author_path(@author)
        expect(page).to have_link 'Edit', href: edit_author_path(@author)
    end
    it "should have a 'delete' link for each author" do
        @author = FactoryBot.create :author
        visit authors_path
        expect(page).to have_link 'Delete', href: author_path(@author)
    end
    it "should have a link to the new author page" do
        visit authors_path
        expect(page).to have_link 'New', href: new_author_path
    end
end