module MessagesHelper
	EMOTICONS_MAPPER = {
		":)" => "emoticons/smile-1-1.png",
		";)" => "emoticons/smile-1-1.png",
		":(" => "emoticons/smile-2-1.png",
		":/" => "emoticons/smile-1-1.png",
		":D" => "emoticons/happy-4.png",
		"^_^" => "emoticons/smile-4-1.png",
	}
	def parse_emoticons(msg)
		msg.gsub!(/(:\)|=\)|\(:|\(=)/, image_tag(asset_path EMOTICONS_MAPPER[":)"]))
		msg.gsub!(/(:\(|=\(|\):|\)=)/, image_tag(asset_path EMOTICONS_MAPPER[":("]))
		msg.gsub!(/:\//, image_tag(asset_path EMOTICONS_MAPPER[":/"]))
		msg.gsub!(/(:D|=D)/, image_tag(asset_path EMOTICONS_MAPPER[":D"]))
		msg.gsub!(/\^_\^/, image_tag(asset_path EMOTICONS_MAPPER["^_^"]))
		msg.html_safe
	end
end