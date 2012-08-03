module PagesHelper
	include ProfilesHelper
	def render_correct_item_type(feed_item)
		case feed_item.class.to_s
		when "PrivateMessage"
			render 'feed_items/private_message', object: feed_item
		when "Wink"
			render 'feed_items/wink', object: feed_item
		when 'Favorite'
			render 'feed_items/favorite', object: feed_item
		when 'View'	
			render 'feed_items/view', object: feed_item
		end
	end

	def display_other_photo_view(view)
		current_user.profile == view.viewer ? link_to(display_main_photo_mini(view.viewed), view.viewed) : 
				link_to(display_main_photo_mini(view.viewer), view.viewer)
	end
	
	def display_other_photo_wink(wink)
		current_user.profile == wink.sender ? link_to(display_main_photo_mini(wink.receiver), wink.receiver) : 
				link_to(display_main_photo_mini(wink.sender), wink.sender)
	end
	
	def display_other_photo_favorite(favorite)
		current_user.profile == favorite.favoriter ? link_to(display_main_photo_mini(favorite.favoritee), 
			favorite.favoritee) : 	link_to(display_main_photo_mini(favorite.favoriter), favorite.favoriter)
	end

	def display_other_photo_message(message)
		current_user.profile == message.sender ? link_to(display_main_photo_mini(message.receiver), 
			message.receiver) : link_to(display_main_photo_mini(message.sender), message.sender)
	end

	def correct_viewer(view)
		current_user.profile==view.viewer ? "You Viewed #{view.viewed.nick_name}" :
				"Viewed by #{view.viewer.nick_name}"
	end

	def correct_winker(wink)
		current_user.profile==wink.sender ? "You winked at #{wink.receiver.nick_name}" : 
				"You were winked at by #{wink.sender.nick_name}"
	end

	def correct_favoriter(favorite)
		current_user.profile==favorite.favoriter ? "You favorited #{favorite.favoritee.nick_name}" : 
				"You were favorited by #{favorite.favoriter.nick_name}"
	end

	def correct_messager(message)
		current_user.profile==message.sender ? "You sent a message to #{message.receiver.nick_name}" :
				"You received a new message from #{message.sender.nick_name}"
	end

end
