require 'spec_helper'

describe Photo do
  pending "add some examples to (or delete) #{__FILE__}"
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

