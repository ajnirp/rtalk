module MessagesHelper
	# thanks to http://www.fbsmileys.com/
	def emoticon(emotion)
		image_tag(asset_path("emoticons/#{emotion}.png"))
	end

	def parse_emoticons(msg)
		msg.gsub!(/(:\)|=\)|\(:|\(=)/, emoticon("smile"))
		msg.gsub!(/(:\(|=\(|\):|\)=)/, emoticon("frown"))
		msg.gsub!(/(:\/|:\\)/, emoticon("unsure"))
		msg.gsub!(/(:D|=D)/, emoticon("grin"))
		msg.gsub!(/(:O|:-O|:-o|:o)/, emoticon("gasp"))
		msg.gsub!(/(:P|=P)/, emoticon("tongue"))
		msg.gsub!(/(o\.O|o_O)/, emoticon("confused"))
		msg.gsub!(/:'\(/, emoticon("cry"))
		msg.gsub!(/\^_\^/, emoticon("bliss"))
		msg.gsub!(/<3/, emoticon("heart"))
		msg.gsub!(/(>:\(|>:-\()/, emoticon("grumpy"))
		msg.gsub!(/(8-\)|8\)|B-\)|B\))/, emoticon("glasses"))
		msg.gsub!(/(8-\||8\||B-\||B\|)/, emoticon("sunglasses"))
		msg.html_safe
	end
end