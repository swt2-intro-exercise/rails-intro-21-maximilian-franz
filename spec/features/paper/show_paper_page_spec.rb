require 'rails_helper'

describe "Show paper page", type: :feature do
    it "should exist at 'paper_path(paper)' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        @peper = FactoryBot.create :paper
        visit paper_path(@paper)
    end
    it "should display the papers authors name" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        @paper.authors.each do |author|
            expect(page).to have_text(author.name)
        end
    end
end