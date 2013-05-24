class ChangeMessageContentType < ActiveRecord::Migration
	#migration to change the datatype of the "content" attribute of Message
	#it should be 'text', not 'string'
	def up
		change_column :messages, :content, :text
	end

	def down
	end
end
