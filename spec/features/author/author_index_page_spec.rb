require 'rails_helper'

describe "Author index page", type: :feature do
    it "should exist at 'authors_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit authors_path
    end
    it "should display all saved authors" do
        visit authors_path
        Author.all do |author|
            expect(page).to have_css('td', text: author.name)
            expect(page).to have_css('td', text: author.homepage)
        end
        expect(page).to have_link 'New', href: new_author_path
    end
end