class Room < ActiveRecord::Base
	attr_accessor :key	

	def to_param
		key
	end
end
