require 'rails_helper'

describe "Author", type: :model do
    it "should have text inputs for an author's first name, last name, and homepage" do
      author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
      # these are the standard names given to inputs by the Rails form builder
      expect(author.first_name).to eq("Alan")
      expect(author.last_name).to eq("Turing")
      expect(author.homepage).to eq("https://en.wikipedia.org/wiki/Alan_Turing")
    end
    it "should have a method 'name' that returns its full name" do
      author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
      expect(author.name).to eq("Alan Turing")
    end
  end
  