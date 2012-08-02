require 'spec_helper'

describe Search do
  pending "add some examples to (or delete) #{__FILE__}"
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

