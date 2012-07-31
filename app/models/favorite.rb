class Favorite < ActiveRecord::Base
  attr_accessible :favoritee_id
  belongs_to :favoriter, class_name: 'Profile', foreign_key: 'favoriter_id'
  belongs_to :favoritee, class_name: 'Profile', foreign_key: 'favoritee_id'

  validates_uniqueness_of :favoritee_id, scope: :favoriter_id


  default_scope order: 'favorites.created_at DESC'
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

