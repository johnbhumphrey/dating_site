require 'spec_helper'

describe "ProfileCreationAndNavigations" do
	let(:user) { FactoryGirl.create(:user) } 
	let(:submit) { "Submit Profile" }
	before { valid_signin(user) }

	subject { response }

	describe "profile creation" do
		before { click_link "Create a Profile" }

		it { response.should have_selector('h2', content: "Create") }

		describe "invalid information" do

			it "should not create a new profile with invalid info" do
				expect { click_button submit }.not_to change(Profile, :count)
			end

			it "should display errors" do
				click_button submit
				response.should have_selector('div', content: "errors prohibited")
			end
		end

		describe "valid information" do
			before do
			  select 20, from: "Age"
			  select "Male", from: "Sex"
			  select "Female", from: "Interested in"
			  fill_in "Zipcode", with: '02493'
			  select 'Single', from: "Relationship status"
			end

			it "should create a new profile with valid attributes" do
				expect { click_button submit }.to change(Profile, :count).by(1)
			end

			it "should display a flash message and display the profile" do
				click_button submit 
				response.should have_selector('div.success', content: "created profile")
				response.should have_selector('a', content: "Add a new photo")
			end
		end
	end

	describe "profile updating" do
		let(:profile) { FactoryGirl.create(:profile, user: user) }
		before { visit edit_profile_path(profile) }

		it { should have_selector('a', content: "Edit Your Photos") }
		it { should have_selector('h2', content: "Edit your profile") }

		it "should update the profile without changing attributes and display a flash" do
			click_button submit
			should have_selector('div.success', content: 'updated profile')
		end
		it "should make the information invalid and fail to update" do
			fill_in "Zipcode", with: 'asdf'
			click_button submit
			should have_selector('div#error_explanation')
			should have_selector('a', content: "Edit Your Photos")
		end
	end

end
