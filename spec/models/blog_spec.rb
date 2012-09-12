require 'spec_helper'

describe Blog do
  let(:user) { create(:user) }
  before do
    @attr= { title: "Valid title", body: "This is a valid body" }
  end
  context "validations" do
	  it "should create a blog with a valid user and attributes" do
	  	user.blogs.build(@attr).should be_valid
	  end

	  it "should not create a blog without a user" do
	  	Blog.new(@attr).should_not be_valid
	  end

	  it "should not be able to mass assign user_id" do
	  	Blog.new(@attr, user_id: 1).should raise_error
	  end

	  it "should not create a blog with a very short or very long title" do
	  	user.blogs.build(@attr.merge(title: "")).should_not be_valid
	  	user.blogs.build(@attr.merge(title: 'a'*51)).should_not be_valid
	  end

	  it "should not create a blog with too short of a body" do
	  	user.blogs.build(@attr.merge(body: "")).should_not be_valid
	  end

	  it "should not create a blog that's too long" do
	  	user.blogs.build(@attr.merge(body: 'a'*10001)).should_not be_valid
	  end

  end

  describe "associations" do
  	let(:blog) { create(:blog, user: user) }
  	it { should respond_to(:user) }
  end
end
# == Schema Information
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  user_id    :integer
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

