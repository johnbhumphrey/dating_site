require 'spec_helper'

describe "Searches" do
  let(:user) { create(:user) }	
  before do
  	user.profile= create(:profile, user: user) 
    valid_signin(user) 
  end  
  before(:each) do
  	25.times { |f| create(:profile, user: create(:user)) }
  	create(:profile, sex: "Female", age: 18)
  	create(:profile, sex: "Female", age: 35)
  end
  
  after(:each) do 
  	User.delete_all
  	Profile.delete_all
  end	

  describe "the search page" do
  	before { visit new_search_path }

  	it "should have a new search page and return all results" do
  		response.should have_selector('h1', content: 'Advanced Search')
  		click_button "Search"
  		response.should have_selector('div.success')
  		response.should have_selector('h1', content: "Search Results")
  		response.should have_selector('h1', content: "Found 27 profiles")
  	end

  	it "should save do a search and save it within the cache" do
  		select "Female", from: "I am interested in:"
  		click_button "Search"
  		response.should have_selector('h1', content: "Found 2 profiles.")
  		visit new_search_path
  		click_button "Search"
  		response.should have_selector('h1', content: "Found 2 profiles")
  	end
  end
end
