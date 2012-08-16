require 'spec_helper'

describe "HomePages" do
	let(:user) { FactoryGirl.create(:user) } 
	let(:submit) { "Create User" } 

	it "should login without logging in and try to create an invalid user" do
		visit root_url
		response.should have_selector('a', content: "NEW USERS")
		response.should have_selector('a', content: "Sign up?")
		click_link "NEW USERS"
		response.should have_selector('label', content: "Password")
		expect { click_button submit }.not_to change(User, :count)

	end

	it "should have error messages with invalid login" do
		visit new_user_path
		click_button submit
		response.should have_selector('li', content: "Name can't be blank")
	end
	describe "with valid information" do

		before do
			visit new_user_path
			fill_in "Name", with: "Example User"
			fill_in "Email", with: "example@example.com"
			fill_in "What you want your username to be", with: "ExampleUser"
			fill_in "Password", with: "foobar"
			fill_in "Password Confirmation", with: "foobar"
		end	

		it "should create a new user" do
			expect { click_button submit }.to change(User, :count).by(1)
		end

		it "should display a flash success" do
			click_button submit
			response.should have_selector('div', content: "Example User was")
		end
		
	end
	
end
