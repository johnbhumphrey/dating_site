class Announcement < ActiveRecord::Base
  attr_accessible :body	

  validates_presence_of :body
  
  def self.newest
	Announcement.last
  end
  
  def self.newest_private
    Announcement.where("type is null").order("id desc").first
  end

  def self.newest_public
    Announcement.where("type = 'public'").order("id desc").first
  end
  
end
# == Schema Information
#
# Table name: announcements
#
#  id         :integer         not null, primary key
#  message    :string(255)
#  starts_at  :datetime
#  ends_at    :datetime
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

