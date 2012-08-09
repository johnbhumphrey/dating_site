module PrivateMessagesHelper
  
	def other_profile(message)
		if current_user.profile == message.sender
			message.receiver
		else
			message.sender
		end
	end

	def last_reply(message)
		if message.replies.any?
			message.replies.first
		else
			message
		end
	end

	def sent_or_received(message)
		if message.sender== current_user.profile
			"Sent"
		else
			"Received"
		end
	end

	def sent_or_received_class(message)
		if message.sender== current_user.profile
			nil
		else
			"well"
		end
	end


end
