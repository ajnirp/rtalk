module ApplicationHelper
	def show_title
		base_title = "RTalk"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
end
