require 'spec_helper'

describe User do
	before { @attr= { name: "test name", email: "example@example.com", password: "foobar",
  			password_confirmation: "foobar", nick_name: "Admin" } }

  	it "should create a User given valid attributes" do
  		User.create!(@attr).should be_valid
  	end

  	it "should require a valid email address" do
  		invalid_emails = %w["csahlman@foo.", "", "aasdf@com"]
  		invalid_emails.each do |f|
  			invalid_email_user = User.new(@attr.merge(email: f))
  			invalid_email_user.should_not be_valid
  		end	
  	end
  	it "should create a user with a valid email address" do
  		valid_emails = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
  		valid_emails.each do |f|
  			valid_email_user = User.new(@attr.merge(email: f))
  			valid_email_user.should be_valid
  		end	
  	end

  	it "should require a nick_name" do
  		no_nick_name_user= User.new(@attr.merge(nick_name: ""))
  		no_nick_name_user.should_not be_valid
  	end

  	it "should require a name" do
  		User.new(@attr.merge(name: "")).should_not be_valid
  	end

  	it "should reject names that are too long or short" do
  		User.new(@attr.merge(name: 'a'*3)).should_not be_valid
  		User.new(@attr.merge(name: 'a'*21)).should_not be_valid
  	end

  	it "should reject passwords that are too long or short" do
  		User.new(@attr.merge(password: 'a'*51, password_confirmation: 'a'*51)).
  			should_not be_valid
  		User.new(@attr.merge(password: 'a'*5, password_confirmation: 'a'*5)).
  			should_not be_valid
  	end

  	it "should reject duplicate names" do
  		User.create!(@attr)
  		User.new(@attr.merge(email: "another_email@example.com")).should_not be_valid
  		User.new(@attr.merge(email: "another_email@example.com", name: "TEST name")).
  			should_not be_valid
  	end

  	it "should reject duplicate emails of different cases" do
  		User.create!(@attr)
  		User.new(@attr.merge(email: "example@EXAMPle.com")).should_not be_valid
  	end

  	describe "associations" do
  		let(:user) { FactoryGirl.create(:user) }
      let(:profile) { FactoryGirl.create(:profile, user: user) }
  		it { should respond_to(:profile) }
      it "should destroy associated Profiles on deletion" do
        lambda do  #wrap in lambda block so it doesn't actually destroy the last user here
          #and throw an error causing the test to fail
          user.destroy
          Profile.find_by_id(profile.id).should be_nil
          Profile.find(profile).should raise_error
        end
      end
  	end

  	describe "methods" do
      describe "ensure_an_admin_remains" do
        let(:user) { FactoryGirl.create(:user) }
        it "should not be able to delete the only user" do
          lambda { user.destroy }.should raise_error 
          #needs to be in a lambda block or it won't let me destroy the last user
        end
      end

  		# let(:user) { FactoryGirl.create(:user) }

  	end

    describe "the admin variable" do
      let(:user) { FactoryGirl.create(:user) }

      it { should respond_to(:admin) }
      it { should_not be_admin }
      before { user.toggle!(:admin) }
      it { user.should be_admin }
    end


  
end
# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  admin           :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  nick_name       :string(255)
#  remember_token  :string(255)
#

