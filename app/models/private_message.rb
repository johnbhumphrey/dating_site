class PrivateMessage < ActiveRecord::Base
  attr_accessible :body, :read_at, :title, :receiver_id, :sender_id, :conversation_id
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :conversation, :class_name => 'PrivateMessage'  # Reference to parent message
  has_many :replies,  :class_name => 'PrivateMessage', :foreign_key => 'conversation_id',
    order: 'created_at DESC'
  

  #named_scope :in_reply_to, lambda { |message| :conditions => { {:thread => message}, 
  #		:order => 'created_at' } }



  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  default_scope order: 'private_messages.created_at DESC'

  validates :body, presence: true, length: { within: 6..1000 }

  def self.current_conversation(sender_id, receiver_id)
  	messages= sent_messages= self.where('sender_id= ? AND receiver_id= ?', sender_id, receiver_id) +
  	 received_messages= self.where('sender_id= ? AND receiver_id= ?', receiver_id, sender_id)
    unless messages.nil?
      i= (sent_messages+ received_messages).index { |f| f.conversation_id==nil }
    	return messages[i] unless i.nil?
    end
    return nil  
  end


end
# == Schema Information
#
# Table name: private_messages
#
#  id              :integer         not null, primary key
#  body            :text
#  read_at         :datetime
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  sender_id       :integer
#  receiver_id     :integer
#  conversation_id :integer
#

