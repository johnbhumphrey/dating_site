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

  		it { should respond_to(:profile) }
  	end

  	describe "the newsfeed function" do
  		let(:user) { FactoryGirl.create(:user) }

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

