require 'spec_helper'

describe Hidden do
  let(:profile) { create(:profile, user: create(:user)) }
  let(:other_profile) { create(:profile, user: create(:user)) }

  it "should create a new hidden user given valid attributes" do
	profile.hidden_profiles.create!(receiver_id: other_profile).should be_valid	
  end

  it "should not be able to mass assign a user" do
  	expect { Hidden.new(receiver_id: profile, sender_id: other_profile) }.to raise_error
  end

  it "requires both a sender and receiver id" do
  	Hidden.new(receiver_id: profile).should_not be_valid
  end

  describe "associations" do
  	it { should respond_to(:sender) }
  	it { should respond_to(:receiver) }
  end


end
# == Schema Information
#
# Table name: hiddens
#
#  id          :integer         not null, primary key
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

