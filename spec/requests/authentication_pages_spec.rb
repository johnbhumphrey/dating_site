require 'spec_helper'

describe "AuthenticationPages" do
	before { visit login_path }
	let(:user) { FactoryGirl.create(:user) }
	let(:profile) { FactoryGirl.create(:profile, user: user) }
	let(:wrong_user) { FactoryGirl.create(:user) }
	let(:wrong_profile) { FactoryGirl.create(:profile, user: wrong_user)}
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
		describe "visiting another user's edit info" do
			before { valid_signin(user) }
			before { get edit_user_path(wrong_user) }
			specify { response.should redirect_to(root_path)}
		end
	end

	describe "profiles authorization" do
		before do
		  user.profile= profile
		  wrong_user.profile= wrong_profile
		end

		describe "when not signed in" do
			before { get profiles_path } #need get path instead of visit to work
			specify { response.should redirect_to(login_path) }
			before { get edit_profile_path(user) }
			specify { response.should redirect_to(login_path)}
		end

		describe "when signed in" do
			before { valid_signin(user) }
			before { get profiles_path }
			it { response.should be_success }
			it "should not be allowed to edit other profiles" do
				get edit_profile_path(wrong_profile) #visit will give success even on redirect
				response.should_not be_success #get will give an error
				response.should redirect_to(root_path)
			end
			it "should redirect with a flash error" do
				visit edit_profile_path(wrong_profile)
				response.should have_selector('div.error')
			end
			it "should not be allowed to update other profiles" do
				put profile_path(wrong_profile)	
				response.should redirect_to root_path
			end
			it "should be allowed to update own profile" do
				visit edit_profile_path(profile)
				click_button "Submit Profile"
				response.should have_selector('div.success')
			end

			describe "deletion of profiles" do
				describe "as a non admin" do
					it "should not delete someone else's profile if not an admin" do
						expect { delete profile_path(wrong_profile) }.not_to change(Profile, :count)
					end
					it "should be able to delete their own profile" do
						expect { delete profile_path(user) }.to change(Profile, :count).by(-1)
					end

				end
				describe "as an administrator" do
					before { user.toggle!(:admin) }
					it "should delete another profile" do
						expect { delete profile_path(wrong_profile) }.to change(Profile, :count).by(-1)
					end
				end
			end 
		end
	end
end
