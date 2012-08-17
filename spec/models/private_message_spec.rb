require 'spec_helper'

describe PrivateMessage do
   let(:first_user) { FactoryGirl.create(:user) }
   let(:other_user) { FactoryGirl.create(:user) }
   let(:profile) { FactoryGirl.create(:profile, user: first_user) }
   let(:other_profile) { FactoryGirl.create(:profile, user: other_user ) }
   before { @attr= { body: "Here is the body", receiver_id: other_profile.id, 
      sender_id: profile.id} }
  

  it "should create a new private message with valid attributes and have nil conversation" do
  	@message= PrivateMessage.create!(@attr)
    @message.should be_valid
    @message.conversation_id.should be_nil
  end

  describe "the current conversation method" do
    let(:message) { PrivateMessage.create!(@attr) }
    let(:response) { message.replies.create!(@attr.merge(receiver_id: message.sender_id,
      sender_id: message.receiver_id)) }
    describe "success" do
      it "should not be return nil" do
        PrivateMessage.current_conversation(message.sender_id, message.receiver_id).should_not be_nil
      end

      it "should return message head" do
        head_message= PrivateMessage.current_conversation(response.sender_id, response.receiver_id)
        head_message.should eq(message)
      end
    end

    describe "failure" do
      it "should return nil if there is no message" do
        PrivateMessage.current_conversation(1, 34534).should be_nil
        #just putting in a value that would never show up in a test
      end
    end
  end

  describe "validations" do
    let(:long_message) { 'a'*5001 }
    let(:short_message) { 'a' }
    it "should not allow a super short message" do
      PrivateMessage.new(@attr.merge(body: short_message)).should_not be_valid
    end
    it { PrivateMessage.new(@attr.merge(body: long_message)).should_not be_valid }
    it { PrivateMessage.new(@attr.merge(receiver_id: nil)).should_not be_valid }
    it "should require a sender_id" do
      PrivateMessage.new(@attr.merge(sender_id: nil)).should_not be_valid
    end
  end

  describe "associations" do
    let(:message) { PrivateMessage.create!(@attr) } 
    it { message.should respond_to(:replies) }
    it { message.should respond_to(:conversation) }
    it { message.should respond_to(:receiver) }
    it { message.should respond_to(:sender) }
    it { message.should_not respond_to(:profile) }
  end


end
# == Schema Information
#
# Table name: private_messages
#
#  id              :integer         not null, primary key
#  body            :text
#  read_at         :datetime
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  sender_id       :integer
#  receiver_id     :integer
#  conversation_id :integer
#

