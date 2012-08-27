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

	describe "editing a user" do
		before { valid_signin(user) }
		before { visit edit_user_path(user) }
		
		it { should_not have_content("What do you want your username to be") }

		let(:new_name) { "New Name" }	
		let(:new_email) { "newemail@example.com" }

		before do
		  fill_in "Name", with: new_name
		  fill_in "Email", with: new_email
		  fill_in "Password", with: user.password
		  fill_in "Password Confirmation", with: user.password
		  click_button "Update User"
		end

		it { response.should have_selector('div.flash.notice', content: "successfully") }
		specify { user.reload.name.should == new_name }
		specify { user.reload.email.should eq(new_email)}
	end

	describe "the newsfeed" do
		let(:profile) { create(:profile, user: user) }
		let(:p2) { create(:profile, user: create(:user)) }
		let(:p3) { create(:profile, user: create(:user)) }
		let(:p4) { create(:profile, user: create(:user)) }
		before do 
			user.profile= profile
			valid_signin(user)
		end	
		# before { user.profile=  }

		it "should visit the other profiles and create a newsfeed" do
			visit profile_path(p2)
			response.should have_selector('body', content: p2.nick_name)
			click_button "Favorite User"
			response.should have_selector('div.success', content: "TURN ON YOUR JS NUB")
			visit profile_path(p3)
			response.should have_selector('h2', content: p3.nick_name)
			click_button "Send Wink"
			response.should have_selector('div.success', content: "Wink sent!")
			visit profile_path(p4)
			click_button "Hide User"
			response.should have_selector('div.notice', content: "naahh")
			response.should have_selector('li', content: "Viewed #{p2.nick_name}")
			response.should have_selector('li', content: "Viewed #{p3.nick_name}")
			response.should have_selector('li', content: "Viewed #{p4.nick_name}")
			response.should have_selector('li', content: "winked at #{p3.nick_name}")
			response.should have_selector('li', content: "favorited #{p2.nick_name}")
			response.should_not have_selector('li', content: "hid")	
		end
	end
	
end
