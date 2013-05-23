# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_name  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  room_id    :integer
#

class Message < ActiveRecord::Base
  attr_accessible :content, :user_name, :room_id
  belongs_to :room
  validates :content, :presence => true #message should not be blank
end
