require 'spec_helper'

describe Profile do
  before { @attr= { age: 25, zipcode: '02493', about_me: "valid crap here", 
  	good_at: "More stuff here", message_me_if: "More stuff", relationship_status: "Single",
  	sex: "Male", smokes: "No Answer", body_type: "No Answer", height: 72, drinks: "No Answer",
  	religion: "No Answer", income: "No Answer", job: "No Answer", language: "No Answer",
  	drugs: "No Answer", offspring: "No Answer", exercise: "No Answer", 
  	ethnicity: "No Answer", interested_in: "Male" } }	
  before { @user= FactoryGirl.create(:user) }
  	
  describe "creating profiles" do
  	it "should create a profile with valid attributes" do
  		@user.build_profile(@attr).should be_valid
  	end
  end

  describe "methods" do
  	before { @profile= @user.create_profile!(@attr) }
  	  describe "The format height function" do
	  	it "should return a height formatted in feet and inches" do
	  		@profile.format_height.should eq(6.to_s+"'"+0.to_s+'"')
	  	end
	  end

	  describe "all_visible_profiles method" do
	  	
	  end
  end
  describe "associations" do
  	let(:first_profile) { @user.create_profile!(@attr) }
  	it { should respond_to(:sent_winks) }
  	it { should respond_to(:received_winks) }
  	it { should respond_to(:favorites) }
  	it { should respond_to(:favorited_by) }
  	it { should respond_to(:views) }
  	it { should respond_to(:reverse_views) }
  	it { should respond_to(:viewed_profiles) }
  	it { should respond_to(:viewed_by) }
  	it { should respond_to(:searches) }
  	it { should respond_to(:hidden_profiles) }
  	it { should respond_to(:reverse_hidden_profiles) }
  	it { should respond_to(:profiles_hidden) }
  	it { should respond_to(:profiles_hidden_by) }
  	it { should respond_to(:sent_messages) }
  	it { should respond_to(:received_messages) }
  	it { should respond_to(:photos) }
  	it { should respond_to(:user) }
  	it "should have the right associated user" do
  		first_profile.user_id.should eq(@user.id)
  		first_profile.user.should eq(@user)
  	end

  end
end
# == Schema Information
#
# Table name: profiles
#
#  id                  :integer         not null, primary key
#  about_me            :text
#  message_me_if       :text
#  good_at             :text
#  relationship_status :string(255)
#  age                 :integer
#  sex                 :string(255)
#  location            :string(255)
#  user_id             :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  body_type           :string(255)     default("no answer")
#  height              :integer         default(65)
#  ethnicity           :string(255)     default("no answer")
#  smokes              :string(255)     default("no answer")
#  drinks              :string(255)     default("no answer")
#  religion            :string(255)     default("no answer")
#  income              :string(255)     default("no answer")
#  job                 :string(255)     default("no answer")
#  language            :string(255)     default("no answer")
#  drugs               :string(255)     default("no answer")
#  offspring           :string(255)     default("no answer")
#  exercise            :string(255)     default("no answer")
#  zip_code            :integer
#  nick_name           :string(255)
#  interested_in       :string(255)
#  zipcode             :string(255)
#  formatted_height    :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  hidden              :boolean         default(FALSE)
#  new_user            :boolean
#  photos_count        :integer
#

