# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  key        :string(255)
#  title      :string(255)
#

class Room < ActiveRecord::Base
	# attr_accessor :key	

	def to_param
		key
	end
end
