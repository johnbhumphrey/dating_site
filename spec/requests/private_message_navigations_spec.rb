require 'spec_helper'

describe "PrivateMessageNavigations" do
	let(:user) { create(:user) }
	let(:profile1) { create(:profile, user: user) }
	let(:second_user) { create(:user) }
	let(:profile2) { create(:profile, user: second_user)}
	before do
	  user.profile= profile1
	  second_user.profile= profile2
	  valid_signin(user)
	end

	subject { response }

	describe "sending a private message" do
		before { visit profile_path(profile2) }
		it "should send a private message a few private messages" do
			response.should have_selector('h3', content: "private message")	
			fill_in "Message Body", with: "This is a test message 1"
			click_button "Send Message!"
			response.should have_selector('div.success')
			response.should have_selector('div', content: 'This is a test message')
			fill_in "Message Body", with: "This is a test message 2"
			click_button "Send Message!"
			fill_in "Message Body", with: "This is a test message 3"
			click_button "Send Message!"
			visit private_messages_path
			response.should have_selector('a', content: "This is a test message 3")
			response.should_not have_selector('a', content: '1')
			response.should_not have_selector('a', content: '2')
			#want it to only display the head message
		end


	end
end
