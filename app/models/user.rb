class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :email, :nick_name
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { within: 6..50 }
  email_regex= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex }, 
            uniqueness: { case_sensitive: false}

  validates :nick_name, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :sent_messages, class_name: "PrivateMessage", foreign_key: 'sender_id',
      dependent: :destroy
  has_many :received_messages, class_name: "PrivateMessage", foreign_key: 'receiver_id',
      dependent: :destroy

  has_one :profile, dependent: :destroy 

  after_destroy :ensure_an_admin_remains


  private

  def ensure_an_admin_remains
  	if User.count.zero?
  		raise "Can't delete last user" #an exception in the callback triggers an automatic rollback
  		#the exception is thrown to the controller, where we can use a begin/end block to display a flash
  	end
  end
end

# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  admin           :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  profile_id      :integer
#  nick_name       :string(255)
#

