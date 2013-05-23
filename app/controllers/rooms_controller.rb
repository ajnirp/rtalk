class RoomsController < ApplicationController
	include RoomsHelper

	def create
		name_input = params[:name]
		unless valid_name?(name_input)
			cookies[:user_name] = name_input
			redirect_to new_room_path
			return
		end
		new_key = generate_random_url
		@room = Room.create!(key: new_key)
		cookies[:user_name] = name_input
		cookies[:room_key] = new_key
		@room.add_user(name_input)
		redirect_to room_path(@room)
	end

	def destroy
	end

	def join_router
		name_input, key_input = params[:name], params[:key]
		unless valid_name?(name_input) and valid_key?(key_input)
			redirect_to join_path
			return
		end
		@room = Room.find_by_key(key_input)
		cookies[:user_name] = name_input
		cookies[:room_key] = key_input
		@room.add_user(name_input)
		redirect_to room_path(@room)
	end

	def show
		@room = Room.find_by_key(params[:key])	
	end

	private

		def generate_random_url
			# generates a random URL stub used as the key for the room
			letters = ('a'..'z').to_a
			numbers = (0..9).to_a
			return "id" + (letters + numbers).sample(25).join
		end

		def valid_name?(name_input)
			# returns false if the input contains non alphanumeric characters
			# or if it is too short or too long; returns true otherwise

			# only alphanumeric characters allowed in the name
			if !(name_input =~ /^[[:alnum:]]*$/)
				flash[:error] = "Please use only alphabets and numbers in your name"
				return false
			end

			# name length should be between 4 and 20
			if (4..20).include? name_input.length
				return true
			elsif (1..3).include? name_input.length
				flash[:error] = "Too short! Please choose a longer name (at least 4 characters)"
				return false
			elsif name_input.length > 20
				flash[:error] = "Too long! Please choose a shorter name (at most 20 characters)"
				return false
			elsif name_input.length == 0
				flash[:error] = "Please enter a name"
				return false
			end
		end

		def valid_key?(key_input)
			# returns true if key_input is the key of an existing room; returns false otherwise
			if key_input.length == 0
				flash[:error] = "Please enter a key"
				return false
			end
			if Room.find_by_key(key_input).nil?
				flash[:error] = "Error! Either this is not a valid room key, or this room is now inactive."
				return false
			else
				return true
			end
		end
end
