class Photo < ActiveRecord::Base
  attr_accessible :avatar, :primary, :caption
  has_attached_file :avatar,
  :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>", :large => "500x500>" },
    :storage => :s3,
    :bucket => 'csahlman',
    :s3_credentials => {
      :access_key_id => 'AKIAJWWS4KURC6ODGJGQ',
      :secret_access_key => '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'
    }

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

