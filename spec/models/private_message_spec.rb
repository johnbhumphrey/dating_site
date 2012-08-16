require 'spec_helper'

describe PrivateMessage do
  before do
    @user= FactoryGirl.create(:user)
    @other_user= FactoryGirl.create(:other_user)
    @profile= FactoryGirl.create(:profile, user: @user)
    @other_profile= FactoryGirl.create(:profile, user: @other_user)
  	@attr= { body: "Here is the body", receiver_id: @other_profile.id, sender_id: @profile.id}
  end

  it "should create a new private message with valid attributes" do
  	PrivateMessage.new(@attr).should be_valid
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

