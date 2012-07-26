require 'spec_helper'

describe Profile do
  describe "The format height function" do
  	before(:each) do
  		@height= 65
  	end

  	it "should return a height formatted in feet and inches" do
  		
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
#

