require 'spec_helper'

describe PrivateMessage do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: private_messages
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  body            :text
#  read_at         :datetime
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  sender_id       :integer
#  receiver_id     :integer
#  conversation_id :integer
#

