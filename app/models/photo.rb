class Photo < ActiveRecord::Base
  attr_accessible :avatar, :primary, :caption
  has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>", :large => "500x500>" },
    :storage => :s3,
    :bucket => 'csahlman',
    :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET']
    }
  validates :avatar, :attachment_presence => true, allow_blank: true
  validates_attachment_content_type :avatar, content_type: 
    ['image/jpeg', 'image/png', 'image/gif', 'image/jpg' ]
  validates :caption, length: { maximum: 140 }


  belongs_to :profile, counter_cache: true
   	
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

