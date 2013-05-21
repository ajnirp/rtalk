class Message < ActiveRecord::Base
  attr_accessible :content, :user_name
  belongs_to :room
end
