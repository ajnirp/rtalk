module RoomsHelper
	
	def key=(new_key)
		@key = new_key
	end

	def generate_random_url
		letters = ('a'..'z').to_a
		numbers = (0..9).to_a
		(letters+numbers).sample(25).join
	end
end
