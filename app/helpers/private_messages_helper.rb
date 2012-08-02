module PrivateMessagesHelper
  
	def other_profile(message)
		if current_user.profile == message.sender.profile
			message.receiver.profile
		else
			message.sender.profile
		end
	end

	def last_reply(message)
		if message.replies.any?
			message.replies.first
		else
			message
		end
	end

end
