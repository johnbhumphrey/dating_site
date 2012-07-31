module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end

	def sidebar_main_title(title)
		content_for(:sidebar_main_title) { title }
	end

	def sidebar_sub_title(title)
		content_for(:sidebar_sub_title) { title }
	end

	def sidebar2_main_title(title)
		content_for(:sidebar2_main_title) { title }
	end

	def sidebar2_sub_title(title)
		content_for(:sidebar2_sub_title) { title }
	end

end
