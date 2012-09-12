class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :email, :nick_name
  validates :name, presence: true, length: { within: 4..20 }
  validates :password, presence: true, length: { within: 6..50 }
  email_regex= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: email_regex }, 
            uniqueness: { case_sensitive: false}

  validates :nick_name, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password




  has_one :profile, dependent: :destroy 
  has_many :blogs

  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token

  after_destroy :ensure_an_admin_remains

  def news_feed
    feed_items= profile.sent_messages.includes(:sender, :receiver).limit(5).all + 
        profile.received_messages.includes(:sender, :receiver).limit(5).all
    feed_items+= profile.favorites.includes(:favoriter, :favoritee).limit(5).all + 
        profile.favorited_by.includes(:favoriter, :favoritee).limit(5).all
    feed_items+= profile.sent_winks.limit(5).includes(:sender, :receiver).all + 
        profile.received_winks.includes(:sender, :receiver).limit(5).all
    feed_items+= profile.views.limit(25).includes(:viewer, :viewed).all + 
        profile.reverse_views.limit(5).includes(:viewer, :viewed).all
    feed_items.sort_by {|f| f[:created_at]}
  end

  private

    def create_remember_token
      self.remember_token= SecureRandom.urlsafe_base64
    end

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
#  nick_name       :string(255)
#  remember_token  :string(255)
#

