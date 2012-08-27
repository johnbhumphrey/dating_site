require 'spec_helper'

describe Search do
  let(:profile) { create(:profile, user: create(:user)) }
  before(:all) { 25.times { |f| create(:profile, user: create(:user))} }
  let(:default_search) { profile.searches.create! }
  after(:all) do
    User.delete_all
    Profile.delete_all
  end  
  describe "methods" do
  	it { should_not respond_to :find_profiles }
    it { should respond_to :profiles }
  	describe "profiles" do
  		it "should return all profiles if search is empty" do
  			default_search.profiles.count.should == 26
  		end
  	end
  end

  describe "associations" do
  	it { should respond_to :profile }
  end
end
# == Schema Information
#
# Table name: searches
#
#  id                  :integer         not null, primary key
#  keywords            :string(255)
#  min_age             :integer
#  max_age             :integer
#  min_height          :integer
#  max_height          :integer
#  sex                 :string(255)
#  relationship_status :string(255)
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  interested_in       :string(255)
#  save_search         :boolean         default(FALSE)
#  profile_id          :integer
#

