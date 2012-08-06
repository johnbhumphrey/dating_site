class Search < ActiveRecord::Base
  attr_accessible :keywords, :max_age, :max_height, :min_age, :min_height, :relationship_status, 
  	:sex, :interested_in, :save_search

  belongs_to :profile

  def profiles
  	@profiles ||= find_profiles
  end

  private

  	def find_profiles
  		profiles= Profile.visible.order("created_at DESC")
  		profiles= profiles.where("about_me like ?", "%#{keywords}%") if keywords.present?
  		profiles= profiles.where(interested_in: interested_in) if interested_in.present?
  		profiles= profiles.where("age >= ?", min_age) if min_age.present?
  		profiles= profiles.where("age <= ?", max_age) if max_age.present?
  		profiles= profiles.where("height >= ?", min_height) if min_height.present?
  		profiles= profiles.where("height <= ?", max_height) if max_height.present?
  		profiles
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

