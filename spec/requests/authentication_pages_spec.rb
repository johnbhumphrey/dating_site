require 'spec_helper'
require 'utilities'

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

			it "should sign in successfully" do
				valid_signin(user)
				response.should have_selector('div', content: "Welcome back" )	
				response.should have_selector('a', content: 'Sign out')
			end

		end
	end


end
