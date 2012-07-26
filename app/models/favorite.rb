class Favorite < ActiveRecord::Base
  attr_accessible :favoritee_id
  belongs_to :profile

  validates_uniqueness_of :favoritee_id, scope: :favoriter_id

end
# == Schema Information
#
# Table name: favorites
#
#  id           :integer         not null, primary key
#  favoriter_id :integer
#  favoritee_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

