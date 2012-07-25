class AddSenderIdAndReceiverIdToPrivateMessages < ActiveRecord::Migration
  def change
    add_column :private_messages, :sender_id, :integer
    add_column :private_messages, :receiver_id, :integer
  end
end
