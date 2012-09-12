class Blog < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { within: 2..50 }
  validates :body, presence: true, length: { within: 2..10000 }
end
# == Schema Information
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  user_id    :integer
#  body       :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

