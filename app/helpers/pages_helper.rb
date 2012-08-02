module PagesHelper

	def render_correct_item_type(feed_item)
		case feed_item.class
		when "PrivateMessage"
			render 'feed_items/private_message', object: feed_item
		when "Wink"
			render 'feed_items/wink', object: feed_item
		when 'Favorite'
			render 'feed_items/favorite', object: feed_item
		else	
			render 'feed_items/view', object: feed_item
		end
	end

end
