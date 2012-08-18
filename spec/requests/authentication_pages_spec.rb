require 'spec_helper'

describe "AuthenticationPages" do
	before { visit login_path }
	let(:user) { FactoryGirl.create(:user) }
	describe "sign_in page" do
		it "should have a login prompt" do
			response.should have_selector('body', content: "Please Log In")
		end

		describe "unsuccessful signin" do
			it "should display a flash message and rerender page" do
				click_button "Login"
				response.should have_selector('div', content: "Invalid email")
			end
		end
		describe "successful signin" do
			before { valid_signin(user) }
			it "should sign in successfully" do
				response.should have_selector('div', content: "Welcome back" )	
				response.should have_selector('a', content: 'Sign out')
				response.should have_selector('a', content: "Create a Profile")
				response.should have_selector('h1', content: "Welcome to Mega Date")
			end
			it { should_not have_link("Sign out", href: logout_path) }
			# before { get profiles_path }
			# it { response.should redirect_to new_profile_path }
		end
		describe "access when not signed in" do
			before { get edit_user_path(user) }
			it { response.should redirect_to login_path }
			describe "friendly forwarding" do
				before { valid_signin(user) }
				it { response.should have_selector('body', content: "Editing") }
			end
		end
	end

	describe "trying to access the wrong user's info" do
		let(:wrong_user) { FactoryGirl.create(:user) }	
		describe "visiting another user's edit info" do
			before { valid_signin(user) }
			before { get edit_user_path(wrong_user) }
			specify { response.should redirect_to(root_path)}
		end
	end

	describe "profiles" do
		let(:profile) { FactoryGirl.create(:profile, user: user) }
		let(:wrong_user) { FactoryGirl.create(:user) }
		let(:wrong_profile) { FactoryGirl.create(:profile, user: wrong_user)}

		describe "when not signed in" do
			
		end
	end


end
