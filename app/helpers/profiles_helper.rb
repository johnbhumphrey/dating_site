module ProfilesHelper
	def display_main_photo_thumb(profile)
		if profile.has_main_photo?
			image_tag(profile.main_photo.avatar.url(:thumb))
		else
			image_tag('nopicture.png')
		end	
	end

	def display_main_photo(profile)
		if profile.has_main_photo?
			image_tag(profile.main_photo.avatar.url(:medium))
		else
			image_tag('nopicture_full.png')
		end	
	end

	def display_main_photo_mini(profile)
		if profile.has_main_photo?
			image_tag(profile.main_photo.avatar.url(:mini))
		else
			image_tag('nopicture_mini.png')
		end	
	end
end
