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

require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
