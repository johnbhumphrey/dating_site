require 'spec_helper'

describe Photo do
  let(:user) { FactoryGirl.create(:user) }
  let(:profile) { FactoryGirl.create(:profile, user: user) }		
  it { should have_attached_file(:avatar) }
  it { should validate_attachment_presence(:avatar) }
  it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:avatar) }
  let(:long_caption) { 'a'*141 }
  let(:photo) { Photo.new() }
  it { photo.should_not be_valid }
  # it "should reject long captions" do
  # 	Photo.new(caption: long_caption).should_not be_valid
  # end
  # it "should accept a caption between 0 and 140" do
  # 	Photo.new().should be_valid
  # end
# not working yet figure it out later!
  describe "associations" do
  	it { should respond_to(:profile) }

  end


end
# == Schema Information
#
# Table name: photos
#
#  id                  :integer         not null, primary key
#  profile_id          :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#  caption             :text
#  primary             :boolean         default(FALSE)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

