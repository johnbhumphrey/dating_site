require 'spec_helper'

describe "PrivateMessageNavigations" do
	let(:user) { create(:user) }
	let(:profile1) { create(:profile, user: user) }
	let(:second_user) { create(:user) }
	let(:profile2) { create(:profile, user: second_user)}
  let!(:m1) { create(:private_message, sender: profile1, 
      receiver: profile2, created_at: 1.day.ago ) }
  let!(:m2) { create(:reply, sender: profile2, receiver: profile1,
      conversation: m1, created_at: 5.hours.ago)}
  let!(:m3) { create(:reply, sender: profile1, receiver: profile2,
      conversation: m1, created_at: 3.hours.ago)}
  let!(:m4) { create(:reply, sender: profile2, receiver: profile1,
      conversation: m1, created_at: 7.hours.ago)}
  let!(:m5) { create(:reply, sender: profile2, receiver: profile1,
      conversation: m1, created_at: 2.hours.ago)}	
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
	describe "premade messages" do
		before { visit private_messages_path }
		it "has the head message between profile 1 and 2 and visit the resulting path" do
			response.should have_selector('li', content: '2 hours ago')
			response.should_not have_selector('li', content: '7 hours ago')
			click_link "#{m5.body}"
			response.should have_selector('h3', content: "Conversation with #{profile2.nick_name}")
			response.should have_selector('li', content: "#{m2.body}")
			response.should have_selector('li', content: "#{m1.body}")
		end
	end

	describe "trying to access the wrong private message" do
		let(:p3) { create(:profile, user: create(:user)) }
		let!(:m6) { create(:private_message, sender: profile2, 
      receiver: p3) }
    	it "denies access to viewing the private message between 2 other people" do
    		get private_message_path(m6)
    		response.should redirect_to(root_path)
    	end
    	it "should not show m6 in the private messages page" do
    		get private_messages_path
    		response.should_not have_selector('li', content: "#{m6.body}")
    		get private_message_path(m1)
    		response.should_not have_selector('li', content: "#{m6.body}")
    	end

	end
end
