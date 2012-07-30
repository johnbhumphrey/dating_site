class View < ActiveRecord::Base
  attr_accessible :viewed_id

  validates :viewed_id, presence: true
  validates :viewer_id, presence: true

  belongs_to :viewer, class_name: "Profile", foreign_key: "viewer_id"
  belongs_to :viewed, class_name: "Profile", foreign_key: "viewed_id"

  default_scope order: 'created_at DESC'

end
# == Schema Information
#
# Table name: views
#
#  id         :integer         not null, primary key
#  viewer_id  :integer
#  viewed_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

