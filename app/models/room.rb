# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  key        :string(255)
#  title      :string(255)
#  user_list  :text             default("")
#

# the list of users is stored in the variable "users_list", which is actually a string
class Room < ActiveRecord::Base
	attr_accessible :key, :user_list

	has_many :messages, :dependent => :destroy

	USERS_SEPARATOR = ","

	def to_param
		key
	end

	def add_user(user)
		set_user_list!(get_user_list + [user]) unless get_user_list.include?(user)
	end

	def remove_user(user)
		set_user_list!(get_user_list - [user]) if get_user_list.include?(user)
	end

	def get_user_list
		# returns a list from the comma separated "user_list" string
		self.user_list.split(USERS_SEPARATOR)
	end

	def set_user_list!(input_list)
		# input_list is a list that we want to convert to a string and then assign to user_list
		self.user_list = input_list.join(USERS_SEPARATOR)
		self.save!
	end

	#overriding the find method for ActiveRecord
	def self.find(id)
		find_by_key(id)
	end

	def self.ordered
	end
end
